variable "environment" {}

variable "hosted_zone_id" {
  description = "ID for the hosted zone"
  type        = string
}

variable "custom_domain_name" {
  description = "Custom domain name of the api gateway"
  type        = string
}

variable "api_gateway_id" {
  description = "API Gateway ID"
  type        = string
}

variable "acm_certificate_arn" {
  description = "The ARN for the ACM Certificate in us-east-1 region"
  type        = string
}

variable "api_gateway_deployment_id" {
  description = "API Gateway Deployment ID"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}
