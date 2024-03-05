
# ses_sns.tf
# SES and SNS configuration
resource "aws_ses_email_identity" "email_identity" {
  email = var.email
}

resource "aws_sns_topic" "slack_notifications" {
  name = var.sns_name
}

# Additional resources for SES and SNS policies might be required depending on your specific setup
