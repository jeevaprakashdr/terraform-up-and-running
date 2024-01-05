provider "aws" {
    region = "us-east-2"
}

resource "aws_security_group" "instance" {
  name = "terraform-webserver-security-group"

  ingress {
    from_port = var.server_port
    to_port = var.server_port
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}

resource "aws_instance" "webserver" {
  ami = "ami-0fb653ca2d3203ac1"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.instance.id ]

  user_data = <<-EOF
                #!/bin/bash
                echo "Hello learner from AWS" >> index.html
                nohup busybox httpd -f -p ${var.server_port} &
                EOF
  
  user_data_replace_on_change = true
  tags = {
    name = "terraform webserver"
  }
}