# terraform-aws-postgresql-db


```python
include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path = "../../_env/postgresql-database.hcl"
}
locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("terragrunt.hcl"))
  env      = local.env_vars.locals.aws_env
}
inputs = {
  service    = "users-service"
  db_endpoint = "database-rds.xxxxxxxxxxxx.us-east-1.rds.amazonaws.com:5432"
  db_name     = "user_${local.env}"
  db_username = "user_${local.env}"
  root_db_user = "root_db_user"
  account_id_master_db_password = "000000000000"
}

```