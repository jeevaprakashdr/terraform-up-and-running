output "alb_dns_name" {
  value = aws_lb.webserver.dns_name
}

output "alb_security_group_id" {
  value = aws_security_group.alb.id
}

output "asg_name" {
  value = aws_autoscaling_group.webserver.name
}