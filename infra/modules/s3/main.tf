resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket_name

  tags = {
    Project     = "day5-handson"
    Environment = var.environment
    Owner       = "data-platform"
  }
}

resource "aws_s3_bucket_versioning" "mybucket_versioning" {
  bucket = aws_s3_bucket.mybucket.id

  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }
}
