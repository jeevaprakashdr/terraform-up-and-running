provider "aws" {
    region = "us-east-2"
}

module "webserver_cluster" {
  source = "../../../modules/webservice-cluster"

  instance_type = "t2.micro"
  min_size = 2
  max_size = 10

  cluster_name = "webserver_cluster_production"
  db_remote_state_bucket = "terraform-up-and-running-state-japas"
  db_remote_state_key =  "prod/data-stores/mysql/terraform.tfstate"

  enable_auto_scaling = true
  custom_tags = {
    Owner = "rj_team"
    ManagedBy = "terraform"
  }
}