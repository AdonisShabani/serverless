variable "environment" {
  description = "Environment of the application, e.x. dev, prod, stage"
  type        = string
  default     = "dev"
}

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "eu-central-1"
}

variable "paths" {
  description = "API Gateway resurce paths"
  type        = list(string)
  default     = ["/users", "/enrolled", "/courses"]
}

variable "http_method" {
  description = "HTTP Method (GET, POST, PUT, DELETE, HEAD, OPTIONS, ANY)"
  type        = string
  default     = "ANY"
}

variable "handler" {
  description = "Handler for AWS Lambda"
  type        = string
  default     = "hello.handler"
}

variable "file_type" {
  description = "The type of archive to generate. NOTE: zip is supported."
  type        = string
  default     = "zip"

}

variable "filename" {
  description = "Path to the function's deployment package within the local filesystem"
  type        = string
  default     = "hello.js"
}

variable "output_path" {
  description = " The output of the archive file."
  type        = string
  default     = "hello.zip"
}

variable "runtime" {
  description = "AWS Lambda runtime"
  type        = string
  default     = "nodejs12.x"
}

variable "publish" {
  description = "When the Lambda function is created with publish = true the new version is automatically increased and a qualified identifier (version number) becomes available and will be used when setting Lambda permissions"
  type        = bool
  default     = true
}

variable "memory_size" {
  description = "Amount of memory in MB your Lambda Function can use at runtime. Valid value between 128 MB to 10,240 MB (10 GB), in 64 MB increments."
  type        = number
  default     = 512
}

variable "package_type" {
  description = "Lambda deployment package type. Valid values are Zip and Image. Defaults to Zip."
  type        = string
  default     = "zip"

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
