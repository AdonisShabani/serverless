# output "lambda_function_arn" {
#   description = "The ARN of the Lambda Function"
#   value       = aws_lambda_function.lambda[each.key].arn
# }

# output "lambda_function_invoke_arn" {
#   description = "The Invoke ARN of the Lambda Function"
#   value       = aws_lambda_function.lambda[each.key].invoke_arn
# }

# output "lambda_function_name" {
#   description = "The name of the Lambda Function"
#   value       = aws_lambda_function.lambda[each.key].function_name
# }

# output "lambda_function_version" {
#   description = "Latest published version of Lambda Function"
#   value       = aws_lambda_function.lambda[each.key].version
# }