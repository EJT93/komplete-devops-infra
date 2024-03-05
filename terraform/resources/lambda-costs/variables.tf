# S3 Variables
variable "bucket" {}


# Lambda Variables
variable "weekly_function_name" {}
variable "weekly_s3_key" {}

variable "monthly_function_name" {}
variable "monthly_s3_key" {}

variable "handler" {}
variable "runtime" {}
variable "architectures" {
    type    = list(string)
    default = ["x86_64"]
}


# IAM Variables
variable "iam_role_name" {
  description = "The name of the IAM role"
  type        = string
}

variable "policy_name" {
  description = "The name of the IAM policy"
  type        = string
}

variable "lambda_service" {
  description = "The AWS service for the IAM role trust relationship"
  type        = string
  default     = "lambda.amazonaws.com"
}

variable "policy_actions" {
  description = "List of actions the IAM policy allows"
  type        = list(string)
}

variable "policy_resource" {
  description = "The resource the IAM policy applies to"
  type        = string
  default     = "*"
}


# SES SNS Variables
variable "email" {}
variable "sns_name" {}