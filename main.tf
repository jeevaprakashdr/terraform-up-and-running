provider "aws" {
    region = "us-east-2"
}

variable "server_port" {
  description = "http server port number"
  type = number
  default = 8080
}
resource "aws_security_group" "instance" {
  name = "terraform-first-instance-security-group"

  ingress {
    from_port = var.server_port
    to_port   = var.server_port
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
    ami                  = "ami-0fb653ca2d3203ac1"
    instance_type        = "t2.micro"
    vpc_security_group_ids = [aws_security_group.instance.id]
    user_data            = <<-EOF
                #!/bin/bash
                echo "well now you begin" > index.html
                nohup busybox httpd -f -p ${var.server_port} &
                EOF

    user_data_replace_on_change = true

    tags = {
      Name = "terraform-first-instance"
    }
}