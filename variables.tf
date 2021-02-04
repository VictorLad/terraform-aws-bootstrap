variable "prefix" {
  type        = string
  description = "Prefix to use in managed resources."
}

variable "name" {
  type        = string
  description = "Name to give the bucket and lock table."
}

variable "bucket_tags" {
  type        = map(string)
  description = "Tags to apply to the bucket."
}

variable "lock_table_tags" {
  type        = map(string)
  description = "Tags to apply to the lock table."
}