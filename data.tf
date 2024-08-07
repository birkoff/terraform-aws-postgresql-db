data "aws_secretsmanager_secret" "db" {
  name = "arn:aws:secretsmanager:${var.db_secret_region}:${var.db_secret_account_id}:secret:${var.db_secret_name}"
}
data "aws_secretsmanager_secret_version" "credentials" {
  secret_id = data.aws_secretsmanager_secret.db.id
}
