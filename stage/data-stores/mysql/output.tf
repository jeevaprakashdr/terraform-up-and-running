output "address" {
  value = aws_db_instance.example.address
  description = "Connect to mysql database at this address"
}

output "port" {
  value = aws_db_instance.example.port
  description = "Mysql database connection port"
}