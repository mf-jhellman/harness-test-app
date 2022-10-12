# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Terraform state info
terraform {
  backend "s3" {
    bucket  = "tf-state-mf-eiger-dev-default"
    key     = "state/octopus-dummy-example"
    region  = "us-east-1"
    encrypt = true
  }
}


data "aws_caller_identity" "current" {}

# Resource tagging
locals {
  account_id       = data.aws_caller_identity.current.account_id
  tags = {
    environment = "devops"
    terraform   = "managed"
  }
}
