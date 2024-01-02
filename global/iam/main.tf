provider "aws" {
  region = "us-east-2"
}

module "users" {
  source = "../../modules/iam"
  
  user_names = var.user_names
}