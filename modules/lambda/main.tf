resource "aws_iam_role" "iam_for_lambda" {
  name = var.lambda_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Sid       = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_lambda_function" "lambda" {
  filename      = var.filename
  function_name = var.function_name
  description   = var.description
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = var.handler
  runtime       = var.runtime
  publish       = var.publish
  memory_size   = var.memory_size
  package_type  = var.package_type
  timeout       = var.timeout

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }

  source_code_hash = var.source_code_hash
}

resource "aws_lambda_permission" "api_gtw_users_invoke_permission" {
  function_name = aws_lambda_function.lambda.function_name
  action        = "lambda:InvokeFunction"
  principal     = "apigateway.amazonaws.com"
  source_arn    = var.source_arn
  depends_on    = [aws_lambda_function.lambda]
}
