variable "server_port" {
  description = "The port of webserver serving all the http requests"
  type = number
  default = 8080
}

variable "enable_autoscaling" {
  type = bool
  default = true
}

variable "server_startup_text" {
  type = string
  default = "Production Request Served: Hello learner from AWS"
}