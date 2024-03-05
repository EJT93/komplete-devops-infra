
# cloudWatch.tf
# CloudWatch Configuration
resource "aws_cloudwatch_event_rule" "weekly_trigger" {
  schedule_expression = "cron(0 11 ? * MON *)"
  name                = "weekly-cost-review-trigger"
}

resource "aws_cloudwatch_event_rule" "monthly_trigger" {
  schedule_expression = "cron(0 0 1 * ? *)"
  name                = "monthly-cost-review-trigger"
}

resource "aws_cloudwatch_event_target" "weekly_target" {
  rule      = aws_cloudwatch_event_rule.weekly_trigger.name
  target_id = "weeklyCostReview"
  arn       = aws_lambda_function.weekly_cost_review.arn
}

resource "aws_cloudwatch_event_target" "monthly_target" {
  rule      = aws_cloudwatch_event_rule.monthly_trigger.name
  target_id = "monthlyCostReview"
  arn       = aws_lambda_function.monthly_cost_review.arn
}
