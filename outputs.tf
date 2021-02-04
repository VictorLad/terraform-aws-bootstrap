output "bucket_name" {
  value = aws_s3_bucket.remote_state_bucket.bucket
  description = "The name of the bucket."
}

output "lock_table_name" {
  value = aws_dynamodb_table.state_lock_table.name
  description = "The name of the table."
}