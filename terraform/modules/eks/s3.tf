# S3 Bucket(s) config
resource "aws_s3_bucket" "helm_chart_bucket" {
    bucket        = var.s3_bucket
    force_destroy = var.bucket_force_destroy
    # Optional: Add more configurations such as lifecycle rules, logging, etc.
}

resource "aws_s3_bucket_policy" "helm_chart_bucket_policy" {
  bucket = aws_s3_bucket.helm_chart_bucket.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::290481657399:user/iamadmin"
      },
      "Action": "*",
      "Resource": "${aws_s3_bucket.helm_chart_bucket.arn}/*"
    }
  ]
}
POLICY
}
