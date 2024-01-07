variable "server_port" {
  description = "The port of webserver serving all the http requests"
  type = number
  default = 8080
}

variable "enable_autoscaling" {
  type = bool
  default = true
}