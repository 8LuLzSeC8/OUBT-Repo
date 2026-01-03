variable "environment" {
  type        = string
  description = "Environment name (dev/prod)"
}

variable "db_identifier" {
  type        = string
  description = "RDS instance identifier"
}

variable "db_name" {
  type        = string
  description = "day5-handson-database"
}
