
# s3.tf
# S3 Configuration
resource "aws_s3_bucket" "lambda_code" {
  bucket = var.bucket
  
  # lifecycle_rule {
  #   id      = "log"
  #   enabled = true

  #   expiration {
  #     days = 30
  #   }
  # }
}
