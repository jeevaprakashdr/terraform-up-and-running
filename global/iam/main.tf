provider "aws" {
  region = "us-east-2"
}

module "users" {
  source = "../../modules/iam"
  
  count = length(var.user_names)
  user_name = var.user_names[count.index]
}