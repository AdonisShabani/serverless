resource "aws_api_gateway_resource" "this" {
  rest_api_id = var.api_gateway_id
  parent_id   = var.api_gateway_root_resource_id
  path_part   = var.path
}

resource "aws_api_gateway_method" "this" {
  rest_api_id   = var.api_gateway_id
  resource_id   = aws_api_gateway_resource.this.id
  http_method   = var.http_method
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "this" {
  rest_api_id             = var.api_gateway_id
  resource_id             = aws_api_gateway_resource.this.id
  http_method             = aws_api_gateway_method.this.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.uri
}

resource "aws_api_gateway_resource" "any_resource" {
  rest_api_id = var.api_gateway_id
  parent_id   = aws_api_gateway_resource.this.id
  path_part   = "{any+}"
}

resource "aws_api_gateway_method" "any_method" {
  rest_api_id   = var.api_gateway_id
  resource_id   = aws_api_gateway_resource.any_resource.id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "any_integration" {
  rest_api_id             = var.api_gateway_id
  resource_id             = aws_api_gateway_resource.any_resource.id
  http_method             = aws_api_gateway_method.any_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.uri
}
