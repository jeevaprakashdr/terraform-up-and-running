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
  server_startup_text = var.server_startup_text
  enable_autoscaling = var.enable_autoscaling

    custom_tags = {
    "Owner" = "Prod-user"
    "ManagedBy" = "Terraform"
  }
}

resource "aws_autoscaling_schedule" "scale_out_during_working_hours" {
  scheduled_action_name = "scale_out_during_working_hours"
  min_size = 2
  max_size = 10
  desired_capacity = 10
  recurrence = "0 9 * * *"

  autoscaling_group_name = module.webserver_cluster.asg_name
}

resource "aws_autoscaling_schedule" "scale_in_during_evenings" {
  scheduled_action_name = "scale_out_during_working_hours"
  min_size = 2
  max_size = 10
  desired_capacity = 2
  recurrence = "0 17 * * *"

  autoscaling_group_name = module.webserver_cluster.asg_name
}