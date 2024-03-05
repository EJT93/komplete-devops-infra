
# lambda.tf
# Lamnda Functions
resource "aws_lambda_function" "weekly_cost_review" {
  function_name = var.weekly_function_name
  handler       = var.handler
  runtime       = var.runtime
  role          = aws_iam_role.lambda_execution_role_costs.arn
  s3_bucket     = aws_s3_bucket.lambda_code.bucket
  s3_key        = var.weekly_s3_key
  architectures = var.architectures

  depends_on = [
    aws_s3_bucket.lambda_code
  ]
}

resource "aws_lambda_function" "monthly_cost_review" {
  function_name = var.monthly_function_name
  handler       = var.handler
  runtime       = var.runtime
  role          = aws_iam_role.lambda_execution_role_costs.arn
  s3_bucket     = aws_s3_bucket.lambda_code.bucket
  s3_key        = var.monthly_s3_key
  architectures = var.architectures

  depends_on = [
    aws_s3_bucket.lambda_code
  ]
}
