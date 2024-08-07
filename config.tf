terraform {
  required_providers {
    postgresql = {
      source = "cyrilgdn/postgresql"
    }
  }
}

provider "postgresql" {
  host            = var.host # "localhost"
  port            = var.port # "5433"
  username        = var.root_db_user
  password        = jsondecode(data.aws_secretsmanager_secret_version.credentials.secret_string)["password"]
  sslmode         = "require"
  superuser       = false
  connect_timeout = 15
}