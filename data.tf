data "aws_secretsmanager_secret" "db" {
  name = "arn:aws:secretsmanager:us-east-1:${var.account_id_master_db_password}:secret:${var.rds_cluster_secret_name}"
}
data "aws_secretsmanager_secret_version" "credentials" {
  secret_id = data.aws_secretsmanager_secret.db.id
}
