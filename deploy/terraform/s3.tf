variable "env" {
  type = string
  description = "environment"
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "zz-harness-terraform-bucket-${var.env}"
  acl    = "private"

  versioning = {
    enabled = true
  }

}

output "bucket" {
  value = module.s3_bucket.s3_bucket_id
}