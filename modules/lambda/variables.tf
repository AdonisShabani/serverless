variable "lambda_role_name" {
  description = "The name of the AWS Lambda role that grants necessary permissions."
  type        = string
}

variable "function_name" {
  description = "A unique name for your Lambda Function to identify it within your environment."
  type        = string
}

variable "filename" {
  description = "The local file path to your Lambda function's deployment package. Specify one of: filename, image_uri, or s3_bucket."
  type        = string
}

variable "description" {
  description = "A brief description of the purpose and functionality of your Lambda Function."
  type        = string
}

variable "handler" {
  description = "The entry point in your code that AWS Lambda invokes when the function is executed."
  type        = string
}

variable "runtime" {
  description = "The runtime environment in which your Lambda Function code executes. Check AWS documentation for valid values."
  type        = string
}

variable "publish" {
  description = "Set to true to automatically increase the function's version when created, which is used for setting permissions."
  type        = bool
}

variable "memory_size" {
  description = "The amount of memory in MB allocated to your Lambda Function during runtime (128 MB to 10,240 MB)."
  type        = number
}

variable "package_type" {
  description = "The type of Lambda deployment package. Use 'Zip' for code-based deployments. Default is 'Zip'."
  type        = string
  default     = "Zip"
}

variable "timeout" {
  description = "The maximum execution time in seconds allowed for your Lambda Function."
  type        = number
  default     = 30
}

variable "subnet_ids" {
  description = "A list of subnet IDs in which the Lambda function can access resources."
  type        = list(string) 
}

variable "security_group_ids" {
  description = "A list of security group IDs associated with the Lambda function."
  type        = list(string)
}

variable "source_code_hash" {
  description = "Used to trigger updates. Must be the base64-encoded SHA256 hash of the package file specified with filename or s3_key."
  type        = string
}

variable "source_arn" {
  description = "The Amazon Resource Name (ARN) of the specific API resource you want to grant permission to."
  type        = string
  default     = null
}

