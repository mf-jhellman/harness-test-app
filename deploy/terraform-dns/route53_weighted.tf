# # resource "aws_route53_record" "www" {
# #   zone_id = aws_route53_zone.primary.zone_id
# #   name    = "www.example.com"
# #   type    = "A"
# #   ttl     = 300
# #   records = [aws_eip.lb.public_ip]
# # }

# # resource "aws_route53_record" "balanced" {

# #     count = "${length(var.target_record)}"

# #     zone_id = var.hosted_zone
# #     name = "${var.record_name}"  # e.g. api.example.com
# #     type = "CNAME"
# #     ttl = "60"
# #     set_identifier = "${element(var.target_record, count.index)}"
# #     health_check_id = "${element(aws_route53_health_check.health.*.id, count.index)}"

# #     records = [
# #         "${element(var.target_record, count.index)}"
# #     ]
# #     weighted_routing_policy  {
# #         weight = 1
# #     }
# # }


# # resource "aws_route53_health_check" "health" {
# #   count = "${length(var.target_record)}"
  
# #   fqdn              = "${element(var.target_record, count.index)}"
# #   type              = "HTTPS"
# #   port              = "443"
# #   resource_path     = "/"  # Make a request to https://api-*.example.com/
# #   failure_threshold = "5"
# #   request_interval  = "30"
# # }

# variable "target_record" {
#   type = map(string) 
#   description = "Hostnames"
# }

# # TODO - Should probably make this a lookup instead of storing static value
# variable "hosted_zone" {
#   type = string 
#   description = "Hosted Zone ID"
# }

# variable "region" {
#   type = string 
#   description = "Hosted Zone ID"
# }

# variable "record_name" {
#   type = string 
#   description = "Record Name"
# }

# variable "target_record" {
#   type = string 
#   description = "Target Record Name"
# }