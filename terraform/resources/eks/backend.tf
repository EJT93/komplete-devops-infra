# backend
terraform {
  backend "s3" {
    bucket          = "elijah-terraform-state"
    key             = "komplete-devops-eks/terraform.tfstate"
    region          = "us-east-2"
    dynamodb_table  = "elijah-terraform-lock-table"
  }
}
