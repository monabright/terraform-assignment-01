terraform {
  backend "s3" {
    bucket = "mona-dev-tfstate"
    key = "mona-dev-tfstate03/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "mona-terraform-state-lock"
  }
}
/*
when creating the Dynamp DB table, make sure to create partition key as "LockID".
*/ 