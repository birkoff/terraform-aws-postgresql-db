variable "db_endpoint" {
  type = string
}

variable "service_name" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_name" {
  type = string
}

variable "account_id_master_db_password" {
  type = string
}

variable "root_db_user" {}

variable "rds_cluster_secret_name" {
  type    = string
  default = "/app/rds/psql"
}