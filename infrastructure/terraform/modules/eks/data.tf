data "terraform_remote_state" "vpc" {
  backend                 = "s3"
  config  = {
    bucket                = "elijah-terraform-state"
    key                   = "komplete-devops-vpc/terraform.tfstate"
    region                = "us-east-2"
  }
}