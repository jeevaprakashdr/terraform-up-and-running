provider "aws" {
    region = "us-east-2"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name = "webserver-staging"
  db_remote_state_bucket = var.db_remote_state_bucket
  db_remote_state_key = var.db_remote_state_key

  instance_type = "t2.micro"
  min_size = 2
  max_size = 10
  server_port = var.server_port
  server_startup_text = var.server_startup_text
  enable_autoscaling = var.enable_autoscaling

  custom_tags = {
    "Owner" = "staging-user"
    "ManagedBy" = "Terraform"
  }
}