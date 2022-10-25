resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.this.id
  name    = var.record_name
  type    = "CNAME"
  ttl     = 60
  records = var.target_record
}


data "aws_route53_zone" "this" {
  name         = var.hosted_zone_domain
  private_zone = true
}

variable "target_record" {
  type = list(string)
  description = "Hostnames"
}

# TODO - Should probably make this a lookup instead of storing static value
variable "hosted_zone_domain" {
  type = string 
  description = "Hosted Zone Domain"
}

variable "hosted_zone_private" {
  type = bool
  description = "Whether Hosted Zone is private or public"
}


variable "record_name" {
  type = string 
  description = "Record Name"
}