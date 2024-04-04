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

###########################################################
######### Super Mario Application Code ####################
###########################################################
#module "super_mario" {
#  source = "./applications/super_mario"
#  cluster_name = "mario_eks_cluster"
#  desired_size = 1
#  instance_type = ["t2.medium"]
#  max_size = 2
#  min_size = 1
#  node_group_name = "mario_node_group"
#  subnet_ids = module.web_app_vpc.public_subnet_ids
#}