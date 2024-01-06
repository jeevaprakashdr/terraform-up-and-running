provider "aws" {
  region = "us-east-2"
}

resource "aws_iam_user" "users" {
   count = length(var.users)
   name = var.users[count.index]
}