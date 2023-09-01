output "lambda_function_arn" {
  description = "The ARN of the Lambda Function"
  value       = [for k, v in moudle.lambda : v.lambda_function_arn]
}

output "lambda_function_invoke_arn" {
  description = "The Invoke ARN of the Lambda Function"
  value       = [for k, v in moudle.lambda : v.lambda_function_invoke_arn]
}

output "lambda_function_name" {
  description = "The name of the Lambda Function"
  value       = [for k, v in moudle.lambda : v.lambda_function_name]
}

output "lambda_function_version" {
  description = "Latest published version of Lambda Function"
  value       = [for k, v in moudle.lambda : v.lambda_function_version]
}
