variable "server_port" {
  description = "The port of webserver serving all the http requests"
  type = number
  default = 8080
}

variable "db_remote_state_bucket" {
  type = string
  default = "terraform-up-and-running-state-2024-3qi9"
}

variable "db_remote_state_key" {
  type = string
  default = "stage/services/mysql/terraform.tfstate"
}

variable "enable_autoscaling" {
  type = bool
  default = false
}