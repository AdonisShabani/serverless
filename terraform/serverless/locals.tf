locals {
  project                    = "appstellar_academy"
  rest_api_name              = format("%s-api-%s", local.project, var.environment)
  rest_api_description       = "Appstellar Academy Rest API Gateway"
  lambda_iam_policy_name     = format("%s_lambda_policy_%s", local.project, var.environment)
  lambda_iam_role_name       = format("%s_lambda_role_%s", local.project, var.environment)
  

  lambda_modules = {
    "users" = {
      function_name = "lambda_user"
      description   = "Lambda for users"
    },
    "enrolled" = {
      function_name = "lambda_enrolled"
      description   = "Lambda for enrolled accounts"
    },
    "courses" = {
      function_name = "lambda_courses"
      description   = "Lambda for courses"
    }
  }
}
