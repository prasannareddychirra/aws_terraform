# Capture subnet IDs from VPC module output
output "web_app_vpc" {
  value = module.web_app_vpc.vpc_id
}

#output "public_subnet_ids" {
#  value = aws_subnet.public.*.id
#}
#
#output "private_subnet_ids" {
#  value = module.web_app_vpc.private_subnet_ids
#}