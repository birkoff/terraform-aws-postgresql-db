variable "db_endpoint" {
  type = string
}

variable "application" {
  default = ""
}

variable "service" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_name" {
  type = string
}

variable "root_db_user" {}

variable "db_secret_account_id" {
  type = string
}

variable "db_secret_name" {
  type    = string
}

variable "db_secret_region" {
  type    = string
}

variable "host" {
  type    = string
}

variable "port" {
  type    = string
}