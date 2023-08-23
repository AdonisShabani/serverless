resource "aws_api_gateway_rest_api" "api_gtw" {
  name        = local.rest_api_name
  description = local.rest_api_description
}

module "rest_api_resources" {
  for_each = toset(var.paths)
  source = "../modules/api-integration"

  api_gateway_id = aws_api_gateway_rest_api.api_gtw.id
  api_gateway_root_resource_id = aws_api_gateway_rest_api.api_gtw.root_resource_id
  path = each.key
  http_method = "ANY"
  uri = module.lambda_user
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

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


resource "aws_lambda_function" "lambda" {
  for_each =  {for k,v in local.lambda_modules : k => v}
  filename      = "lambdatest.zip"
  function_name = each.key
  description =   each.value.description
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = var.handler
  runtime       = var.runtime
}

# module "lambda_user" {
#   source         = "terraform-aws-modules/lambda/aws"

#   function_name  = "lambda_user"
#   description    = var.description
#   handler        = var.handler
#   runtime        = var.runtime
#   publish        = var.publish
#   create_package = var.create_package
#   memory_size    = var.memory_size
#   timeout        = var.timeout
#   create_role    = true
#   # local_existing_package = var.lambda_package
#   s3_existing_package = var.s3_existing_package

#   vpc_subnet_ids         = var.vpc_subnet_ids
#   vpc_security_group_ids = var.vpc_security_group_ids
#   attach_network_policy  = true

#   environment_variables    = var.environment_variables
#   attach_policy_statements = var.attach_policy_statements
#   policy_statements        = var.policy_statements

#   tags = var.tags
# }

resource "aws_lambda_permission" "api_gtw_users_invoke_permission" {
  for_each = {for k,v in local.lambda_modules : k => v}
  function_name = each.key
  action        = "lambda:InvokeFunction"
  principal     = "apigateway.amazonaws.com"
  source_arn    = var.source_arns
  depends_on    = [aws_lambda_function.lambda[each.key]]
}