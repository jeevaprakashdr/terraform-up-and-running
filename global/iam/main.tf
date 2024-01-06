provider "aws" {
  region = "us-east-2"
}

module "users" {
  source = "../../modules/landing-zones/iam"

  count = length(var.user_names)
  user_name = var.user_names[count.index]
}