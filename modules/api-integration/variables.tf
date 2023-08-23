variable "api_gateway_id" {
  type        = string
  description = "API Gateway id"
}

variable "api_gateway_root_resource_id" {
  type        = string
  description = "Parent ID of the resource"
}

variable "path" {
  type        = string
  description = "Resource path"
}

variable "http_method" {
  type        = string
  description = "Resource HTTP method"
}

variable "uri" {
  type        = string
  description = "URI to integrate with"
}
