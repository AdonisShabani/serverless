locals {
    project = "Appstellar-Academy"
    rest_api_name = "appstellar-academy-api-${var.environment}"
    rest_api_description = "Appstellar Academy Rest API Gateway"


    lambda_modules = {
        lambda_user = {
            function_name = "lambda_user"
            description = "Lambda for users"
        },
        lambda_enroled = {
            function_name = "lambda_endrolled"
            descrption = "Lambda for enrolled accounts"
        },
        lambda_payment = {
            function_name = "lambda_payment"
            descrption = "Lambda for paying accounts"
        }

    }
    
}