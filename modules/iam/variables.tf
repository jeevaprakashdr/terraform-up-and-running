variable "user_names" {
  description = "iam user name"
  type = list(string)
}

variable "give_kao_full_access" {
  description = "if true, kao gets full access to cloud watch"
  type = bool
  default = false
}