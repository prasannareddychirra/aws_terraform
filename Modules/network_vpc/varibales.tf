variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
}

variable "public_subnet_name" {
  type = string
}

variable "private_subnet_name" {
  type = string
}

variable "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC."
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC."
  type        = bool
  default     = true
}

variable "public_subnet_cidr_blocks" {
  type    = list(string)
#  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]  # Modify as per requirement
}

variable "private_subnet_cidr_block" {
  type    = list(string)
#  default = "10.0.4.0/24"  # Modify as per requirement
}

variable "availability_zones" {
  description = "List of availability zones in which to create subnets."
  type        = list(string)
}

variable "map_public_ip_on_launch" {
  description = "Whether to enable auto-assigning public IP on launch for the subnet."
  type        = bool
  default     = false
}

variable "public_subnets" {
  description = "List of CIDR blocks for the public subnets."
  type        = list(string)
  default     = []
}

variable "private_subnets" {
  description = "List of CIDR blocks for the private subnets."
  type        = list(string)
  default     = []
}

# ... Add other variables as needed

