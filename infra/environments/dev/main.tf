module "s3" {
  source = "../../modules/s3"

  bucket_name       = "day5-dev-bucket"
  environment       = var.environment
  enable_versioning = true
}

module "lambda" {
  source = "../../modules/lambda"

  environment = var.environment
}

module "rds" {
  source = "../../modules/rds"

  environment   = var.environment
  db_identifier = "day5-dev-db"
  db_name       = "masterdata"
}
