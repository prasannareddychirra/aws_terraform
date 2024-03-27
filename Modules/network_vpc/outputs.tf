output "vpc_id" {
  description = "The ID of the VPC."
  value       = aws_vpc.main.id
}

output "private_subnet_ids" {
  value = { for k, subnet in aws_subnet.subnet_private : k => subnet.id }
}

output "public_subnet_ids" {
  value = { for k, subnet in aws_subnet.subnet_public : k => subnet.id }
}



