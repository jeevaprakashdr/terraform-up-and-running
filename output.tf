output "webserver_public_ip_address" {
  value = aws_instance.webserver.public_ip
}

output "alb_dns_name" {
  value = aws_lb.webserver.dns_name
}