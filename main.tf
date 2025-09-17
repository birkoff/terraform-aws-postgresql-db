locals {
  secret_name = "/${var.service}/postgresql_db"
}

resource "postgresql_database" "this" {
  name = var.db_name
}

resource "postgresql_role" "this" {
  depends_on = [random_password.db_password]
  name       = var.db_username
  login      = true
  password   = random_password.db_password.result
}

resource "postgresql_grant" "this" {
  role        = postgresql_role.this.name
  database    = postgresql_database.this.name
  schema      = "public"
  object_type = "table"
  privileges  = ["ALL"]
}

module "secrets_manager" {
  depends_on              = [random_password.db_password, postgresql_database.this, postgresql_role.this, postgresql_grant.this]
  source                  = "git::https://github.com/terraform-aws-modules/terraform-aws-secrets-manager.git//"
  name                    = local.secret_name
  description             = "Credentials of RDS Database"
  recovery_window_in_days = 7
  # Policy
  block_public_policy = true
  secret_string = jsonencode({
    engine   = "postgresql",
    host     = jsondecode(data.aws_secretsmanager_secret_version.credentials.secret_string)["host"],
    username = var.db_username,
    password = random_password.db_password.result,
    port     = jsondecode(data.aws_secretsmanager_secret_version.credentials.secret_string)["port"],
    database = var.db_name
  })
}

resource "random_password" "db_password" {
  length           = 8     # Specify the desired password length
  special          = true   # Include special characters in the password
  override_special = "/_+=.@-" # Optional: Specify additional special characters
}
