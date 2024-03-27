######################### Common Variables ##########################
region = "us-east-1"

#####################################################################
################# New Variables ####################################
########VPC#################
cidr_block = "10.0.0.0/16"
vpc_name = "Webapp"
enable_dns_support = true
enable_dns_hostnames = true
availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_subnet_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet_cidr_blocks = ["10.0.4.0/24"]
public_subnet_name = "web_app_public_subnet"
private_subnet_name = "web_app_private_subnet"

