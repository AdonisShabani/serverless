resource "aws_api_gateway_domain_name" "custom_domain_name" {
  certificate_arn = var.acm_certificate_arn
  domain_name     = var.custom_domain_name
  tags            = var.tags
}

resource "aws_api_gateway_base_path_mapping" "mapping" {
  api_id      = var.api_gateway_id
  stage_name  = var.environment
  domain_name = aws_api_gateway_domain_name.custom_domain_name.domain_name
  depends_on = [
    var.api_gateway_deployment_id
  ]
}

resource "aws_route53_record" "api" {
  name    = aws_api_gateway_domain_name.custom_domain_name.domain_name
  type    = "A"
  zone_id = var.hosted_zone_id

  alias {
    evaluate_target_health = true
    name                   = aws_api_gateway_domain_name.custom_domain_name.cloudfront_domain_name
    zone_id                = aws_api_gateway_domain_name.custom_domain_name.cloudfront_zone_id
  }
}

resource "aws_api_gateway_method_settings" "api_gateway_settings" {
  rest_api_id = var.api_gateway_id
  stage_name  = var.environment
  method_path = "*/*"
  settings {
    logging_level      = "INFO"
    data_trace_enabled = true
    metrics_enabled    = true
  }
  depends_on = [
    aws_api_gateway_base_path_mapping.mapping
  ]
}
