output "bucket_name" {
  value = aws_s3_bucket.bucket.id
  description = "The id of the S3 bucket created by this module"
}
