terraform {
  backend "s3" {
    bucket          = "elijah-terraform-state"
    key             = "r53-e-torrence-a-record/terraform.tfstate"
    region          = "us-east-2"
    dynamodb_table  = "elijah-terraform-lock-table"
  }
}
