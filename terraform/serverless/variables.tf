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

variable "aws_access_key" {
  type        = string
  description = "AWS Access Key"
}

variable "aws_secret_access_key" {
  type        = string
  description = "AWS Access Secret Key"
}

variable "paths" {
  description = "API Gateway resurce paths"
  type        = list(string)
  default     = ["users", "enrolled", "courses"]
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

# variable "file_type" {
#   description = "The type of archive to generate. NOTE: zip is supported."
#   type        = string
#   default     = "zip"

# }

# variable "filename" {
#   description = "Path to the function's deployment package within the local filesystem"
#   type        = string
#   default     = "hello.js"
# }

# variable "output_path" {
#   description = " The output of the archive file."
#   type        = string
#   default     = "hello.zip"
# }

variable "runtime" {
  description = "AWS Lambda runtime"
  type        = string
  default     = "nodejs18.x"
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

variable "package_type" {
  description = "Lambda deployment package type. Valid values are Zip and Image. Defaults to Zip."
  type        = string
  default     = "Zip"

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

variable "lambda_package" {
  description = "The absolute path to an existing zip-file to use"
  type        = string
  default     = "./hello-world/hello-world.zip"
}

variable "attach_network_policy" {
  description = "Controls whether VPC/network policy should be added to IAM role for Lambda Function"
  type        = bool
  default     = true
}

variable "attach_tracing_policy" {
  description = " Controls whether X-Ray tracing policy should be added to IAM role for Lambda Function"
  type        = bool
  default     = true
}
variable "attach_policy_statements" {
  description = "Controls whether policy_statements should be added to IAM role for Lambda Function"
  type        = bool
  default     = false
}

variable "policy_statements" {
  description = " Map of dynamic policy statements to attach to Lambda Function role"
  type        = any
  default     = {}
}
