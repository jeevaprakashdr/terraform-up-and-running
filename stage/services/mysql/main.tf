provider "aws" {
  region = "us-east-2"
}

resource "aws_db_instance" "webserver_db" {
  identifier_prefix = "terraform-up-and-running"
  engine = "mysql"
  allocated_storage = 10
  instance_class = "db.t2.micro"
  skip_final_snapshot = true
  db_name = "webserver_db"

  username = var.db_username
  password = var.db_password

}

terraform {
  backend "s3" {
    bucket = "terraform-up-and-running-state-2024-3qi9"
    key = "stage/services/mysql/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "terraform-up-and-running-locks"
    encrypt = true
  }
}