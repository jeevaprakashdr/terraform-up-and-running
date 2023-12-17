variable "db_username" {
  description = "the master username for the database"
  type = string
  sensitive = true
}

variable "db_password" {
  description = "the master password for the database"
  type = string
  sensitive = true
}