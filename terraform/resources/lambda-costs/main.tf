module "lambda-costs" {
    source =  "../../modules/lambda-costs"

    bucket                  = var.bucket 
    weekly_function_name    = var.weekly_function_name
    weekly_s3_key           = var.weekly_s3_key
    monthly_function_name   = var.monthly_function_name
    monthly_s3_key          = var.monthly_s3_key
    handler                 = var.handler
    runtime                 = var.runtime
    iam_role_name           = var.iam_role_name
    policy_name             = var.policy_name
    lambda_service          = var.lambda_service
    policy_actions          = var.policy_actions
    policy_resource         = var.policy_resource
    email                   = var.email
    sns_name                = var.sns_name

}