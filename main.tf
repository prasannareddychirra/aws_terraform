############################################################
############## Network Module ##############################
module "web_app_vpc" {
  source = "./Modules/network_vpc"
  availability_zones = var.availability_zones
  private_subnet_cidr_block = var.private_subnet_cidr_blocks
  public_subnet_cidr_blocks = var.public_subnet_cidr_blocks
  public_subnet_name = var.public_subnet_name
  private_subnet_name = var.private_subnet_name
  vpc_cidr = var.cidr_block
  vpc_name = var.vpc_name
}
#########################################################
