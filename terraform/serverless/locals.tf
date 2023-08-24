locals {
  project                    = "Appstellar-Academy"
  rest_api_name              = format("%s-api-%s", local.project, var.environment)
  rest_api_description       = "Appstellar Academy Rest API Gateway"
  lambda_iam_policy_name     = format("%s-lambda-policy-%s", local.project, var.environment)
  lambda_iam_role_name       = format("%s-lambda-role-%s", local.project, var.environment)
  cloudwatch_logs_gorup_name = format("%s-lambda-logs-%s", local.project, var.environment)



  lambda_modules = {
    "/users" = {
      function_name = "lambda_user"
      description   = "Lambda for users"
    },
    "/enrolled" = {
      function_name = "lambda_enrolled"
      description   = "Lambda for enrolled accounts"
    },
    "/courses" = {
      function_name = "lambda_courses"
      description   = "Lambda for courses"
    }
  }
}
