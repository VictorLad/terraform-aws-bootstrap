# AWS Bootstrap Terraform module

Terraform module which creates S3 Bucket and DynamoDB resources on AWS.

## Terraform versions

Terraform 0.14 and newer.

## Usage

```hcl
module "bootstrap" {
  source = "terraform-aws-bootstrap"

  prefix = module.config.prefix
  name   = "tf-state"

  bucket_tags     = module.bucket_tags.tags
  lock_table_tags = module.lock_table_tags.tags

  providers = {
    aws = aws.tf_state
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14.0 |
| aws | >= 3.20.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.20.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket\_tags | Tags to apply to the bucket. | `map(string)` | n/a | yes |
| lock\_table\_tags | Tags to apply to the lock table. | `map(string)` | n/a | yes |
| name | Name to give the bucket and lock table. | `string` | n/a | yes |
| prefix | Prefix to use in managed resources. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| bucket\_name | The name of the bucket. |
| lock\_table\_name | The name of the table. |