variable "environment" {
  description = "Environment of the application, e.x. dev, prod, stage"
  type = string
  default = "dev"
}

variable "region" {
  description = "AWS Region"
  type = string
  default = "eu-central-1"  
}

variable "paths" {
  description = "API Gateway resurce paths"
  type = list(string)
  default = [ "/users", "/enrolled", "/payment" ]
  
}

variable "handler" {
  description = "Handler for AWS Lambda"
  type        = string
}

variable "runtime" {
  description = "AWS Lambda runtime"
  type        = string
}

variable "publish" {
  description = "When the Lambda function is created with publish = true the new version is automatically increased and a qualified identifier (version number) becomes available and will be used when setting Lambda permissions"
  type        = bool
  default     = true
}

variable "create_package" {
  description = "Controls whether Lambda package should be created"
  type        = bool
  default     = false
}

variable "memory_size" {
  description = "Amount of memory in MB your Lambda Function can use at runtime. Valid value between 128 MB to 10,240 MB (10 GB), in 64 MB increments."
  type        = number
  default     = 512
}

variable "vpc_subnet_ids" {
  description = "List of subnet ids when Lambda Function should run in the VPC. Usually private or intra subnets."
  type        = list(string)
  default     = null
}

variable "vpc_security_group_ids" {
  description = "List of security group ids when Lambda Function should run in the VPC."
  type        = list(string)
  default     = null
}

variable "attach_policy_statements" {
  description = "Controls whether policy_statements should be added to IAM role for Lambda Function"
  type        = bool
  default     = false
}

variable "policy_statements" {
  description = "Map of dynamic policy statements to attach to Lambda Function role"
  type        = any
  default     = {}
}


variable "s3_existing_package" {
  description = "Bucket name and key for existing lambda package"
  type = object({
    bucket = string
    key    = string
  })
}

variable "environment_variables" {
  description = "A map that defines environment variables for the Lambda Function."
  type        = map(string)
  default     = {}
}

variable "timeout" {
  description = "The amount of time your Lambda Function has to run in seconds."
  type        = number
  default     = 30
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}

variable "source_arns" {
  description = "ARN of the specific resource within that service to grant permission to"
  type        = list(string)
}
