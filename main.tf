/**
 * # terraform-bootstrap-module
 *
 * Initialize a Terraform environment by creating an Amazon S3 bucket to store
 * the remote state files as well as a DynamoDB table used to lock said files.
 */

resource "aws_s3_bucket" "remote_state_bucket" {
  bucket = join("-", [
    "tf",
    var.prefix,
    var.name,
    data.aws_caller_identity.current.account_id,
    data.aws_region.current.name,
  ])

  tags = var.bucket_tags

  force_destroy = true

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "state_lock_table" {
  name = "tf-${var.prefix}-${var.name}"
  tags = var.lock_table_tags

  billing_mode   = "PROVISIONED"
  write_capacity = 1
  read_capacity  = 1

  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}