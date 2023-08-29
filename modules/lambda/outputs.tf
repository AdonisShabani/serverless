output "lambda_function_arn" {
  description = "The ARN of the created Lambda function"
  value       = aws_lambda_function.lambda.arn
}

output "lambda_function_invoke_arn" {
  description = "The Invoke ARN of the Lambda Function"
  value       = aws_lambda_function.lambda.invoke_arn
}

output "lambda_function_name" {
  description = "The name of the Lambda Function"
  value       = aws_lambda_function.lambda.function_name
}

output "lambda_function_version" {
  description = "Latest published version of Lambda Function"
  value       = aws_lambda_function.lambda.version
}

output "iam_role_arn" {
  description = "The ARN of the created IAM role"
  value       = aws_iam_role.iam_for_lambda.arn
}