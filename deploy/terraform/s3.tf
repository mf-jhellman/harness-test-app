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