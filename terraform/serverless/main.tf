resource "aws_api_gateway_rest_api" "api_gtw" {
  name        = local.rest_api_name
  description = local.rest_api_description
}

module "rest_api_resources" {
  for_each = toset(var.paths)
  source   = "../../modules/api-integration"

  api_gateway_id               = aws_api_gateway_rest_api.api_gtw.id
  api_gateway_root_resource_id = aws_api_gateway_rest_api.api_gtw.root_resource_id
  path                         = each.key
  http_method                  = "ANY"
  uri                          = aws_lambda_function.lambda[each.key].invoke_arn
}

resource "aws_cloudwatch_log_group" "cloudwatch_logs" {
  name = "/aws/lambda/${aws_lambda_function.lambda[each.key].function_name}"

  retention_in_days = 30
}
resource "aws_iam_policy" "policy" {
  name        = local.lambda_iam_policy_name
  policy      = data.aws_iam_policy_document.lambda_access_policy.json
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.iam_for_lambda.arn
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_role" "iam_for_lambda" {
  name = local.lambda_iam_role_name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

data "archive_file" "lambda" {
  type        = var.file_type
  source_file = var.filename
  output_path = var.output_path
}


resource "aws_lambda_function" "lambda" {
  for_each           = { for k, v in local.lambda_modules : k => v }
  filename           = var.filename
  function_name      = each.key
  description        = each.value.description
  role               = aws_iam_role.iam_for_lambda.arn
  handler            = var.handler
  runtime            = var.runtime
  publish            = var.publish
  memory_size        = var.memory_size
  package_type       = var.package_type
  # variables          = var.environment_variables
  timeout            = var.timeout

   vpc_config {
    # Every subnet should be able to reach an EFS mount target in the same Availability Zone. Cross-AZ mounts are not permitted.
    subnet_ids         = [element(data.terraform_remote_state.networking.outputs.public_subnets, 1)]
    security_group_ids = [data.terraform_remote_state.networking.outputs.lambda_sg_id]
  }

  source_code_hash = data.archive_file.lambda.output_base64sha256
}

resource "aws_lambda_permission" "api_gtw_users_invoke_permission" {
  for_each      = { for k, v in local.lambda_modules : k => v }
  function_name = each.key
  action        = "lambda:InvokeFunction"
  principal     = "apigateway.amazonaws.com"
  source_arn    = [ "${each.value}/*/*" ]
  depends_on    = [aws_lambda_function.lambda]
}
