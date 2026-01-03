output "bucket_name" {
  value = aws_s3_bucket.mybucket.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.mybucket.arn
}
