variable "bucket_name" {
  type        = string
  description = "My-s3-bucket-day5-handson"
}

variable "environment" {
  type        = string
  description = "Environment name (dev/prod)"
}

variable "enable_versioning" {
  type        = bool
  description = "Enable or suspend S3 versioning"
  default     = true
}
