variable "cluster_name" {
  type = string
}

variable "db_remote_state_bucket" {
  type = string
}

variable "db_remote_state_key" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "min_size" {
  type = number
  description = "Minimum number of instances in ASG"
}

variable "max_size" {
  type = number
  description = "Maximum number of instances in ASG"
}

variable "server_port" {
  type = number
}

variable "custom_tags" {
  type = map(string)
  default = {}
}

variable "enable_autoscaling" {
  type = bool
}