variable "cluster_name" {
  description = "The name of the cluser webservice cluster"
  type = string
}

variable "db_remote_state_bucket" {
  description = "The name of the s3 bucket for database remote state store"
  type = string
}

variable "db_remote_state_key" {
  description = "The path for the database remote state in s3"
  type = string
}

variable "instance_type" {
  description = "The name of EC2 instance type"
  type = string
}

variable "min_size" {
  description = "The minimum number of EC2 instances in ASG"
  type = number
}

variable "max_size" {
  description = "The maximum number of EC2 instances in ASG"
  type = number
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}