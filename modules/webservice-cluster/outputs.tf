output "alb_dns_name" {
  value = aws_lb.example.dns_name
  description = "The domain name of the load balancer"
}

output "alb_security_group_id" {
  value = aws_autoscaling_group.example.id
  description = "ID of the scurity group attached to the load balancer"
}