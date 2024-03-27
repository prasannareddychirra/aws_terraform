variable "region" {
  type        = string
  description = "Region of the VPC"
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr_blocks" {
  type        = list(string)
  description = "List of public subnet CIDR blocks"
}

variable "private_subnet_cidr_blocks" {
  type        = list(string)
  description = "List of private subnet CIDR blocks"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones"
}

variable "public_subnet_name" {
  type = string
}
variable "private_subnet_name" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "enable_dns_support" {
  type = string
}

variable "enable_dns_hostnames" {
  type = string
}