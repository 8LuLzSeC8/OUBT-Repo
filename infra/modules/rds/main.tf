resource "aws_db_instance" "rds_instance" {
  identifier = var.db_identifier

  engine         = "postgres"
  engine_version = "14.9"
  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp2"

  db_name  = var.db_name
  username = "postgres"
  password = "postgres"

  skip_final_snapshot = true
  publicly_accessible = false

  tags = {
    Name        = var.db_identifier
    Environment = var.environment
    Owner       = "day5-handson"
  }
}
