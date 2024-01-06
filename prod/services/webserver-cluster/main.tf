provider "aws" {
    region = "us-east-2"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name = "webserver-production"
  db_remote_state_bucket = "terraform-up-and-running-state-2024-3qi9"
  db_remote_state_key = "stage/services/mysql/terraform.tfstate"

  instance_type = "t2.micro"
  min_size = 2
  max_size = 10
  server_port = var.server_port
}