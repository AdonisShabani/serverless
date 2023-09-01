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
  uri                          = module.lambda[each.key].lambda_function_invoke_arn

}

module "lambda" {
  source         = "terraform-aws-modules/lambda/aws"
  version        = "~> 6.0.0"

  for_each = { for k, v in local.lambda_modules : k => v}
  function_name  = each.value.function_name
  description    = each.value.description
  handler        = var.handler
  runtime        = var.runtime
  publish        = var.publish
  create_package = var.create_package
  memory_size    = var.memory_size
  timeout        = var.timeout
  create_role    = true
  local_existing_package = var.lambda_package
  # s3_existing_package = var.s3_existing_package

  vpc_subnet_ids         = [element(data.terraform_remote_state.networking.outputs.public_subnets, 1)]
  vpc_security_group_ids = [data.terraform_remote_state.networking.outputs.lambda_sg_id]
  attach_network_policy  = var.attach_network_policy

  environment_variables    = var.environment_variables
  attach_policy_statements = var.attach_policy_statements
  policy_statements        = var.policy_statements

}

resource "aws_lambda_permission" "api_gtw_users_invoke_permission" {
  for_each      = { for k, v in local.lambda_modules : k => v }
  function_name = each.value.function_name
  action        = "lambda:InvokeFunction"
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.api_gtw.execution_arn}/*"
  depends_on    = [module.lambda]
}
