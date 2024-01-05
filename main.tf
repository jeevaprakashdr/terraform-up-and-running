provider "aws" {
    region = "us-east-2"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name = "vpc-id"
    values = [ data.aws_vpc.default.id ]
  }
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

resource "aws_launch_configuration" "webserver" {
  image_id = "ami-0fb653ca2d3203ac1"
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.instance.id ]
  
  user_data = <<-EOF
                #!/bin/bash
                echo "Hello learner from AWS" >> index.html
                nohup busybox httpd -f -p ${var.server_port} &
                EOF
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "webserver" {
    launch_configuration = aws_launch_configuration.webserver.name
    vpc_zone_identifier = data.aws_subnets.default.ids
    
    min_size = 2
    max_size = 10

    tag {
      key = "Name"
      value = "terraform_autoscalling_webserver"
      propagate_at_launch = true
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