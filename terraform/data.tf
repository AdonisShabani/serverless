data "aws_iam_policy_document" "lambda_access_policy" {
  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogStream",
      "logs:CreateLogGroup",
      "logs:TagResource",
      "logs:PutLogEvents"
    ]
    resources = [
      "arn:aws:logs:eu-central-1:970967861509:log-group:/aws/lambda/dupont-dvms-api-dev*:*"
    ]
  }
  statement {
    effect = "Allow"
    actions = [
      "xray:PutTraceSegments",
      "xray:PutTelemetryRecords"
    ]
    resources = [
      "*"
    ]
  }
  statement {
    effect = "Allow"
    actions = [
      "s3:*"
    ]
    resources = [
      "*"
    ]
  }
#   statement {
#     effect = "Allow"
#     actions = [
#       "secretsmanager:GetSecretValue"
#     ]
#     resources = [
#       "*"
#     ]
#   }
}
