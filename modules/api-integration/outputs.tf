output "aws_api_gateway_integration_id" {
  value = aws_api_gateway_integration.this.id
}

output "aws_api_gateway_resource_id" {
  value = aws_api_gateway_resource.this.id
}

output "aws_api_gateway_method_id" {
  value = aws_api_gateway_method.this.id
}
