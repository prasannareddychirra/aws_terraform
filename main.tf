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
#  cluster_name = var.mario_cluster_name
#desired_size      = var.mario_desired_size
#  instance_type   = var.mario_instance_type
#  max_size        = var.mario_max_size
#  min_size        = var.mario_min_size
#  node_group_name = var.mario_node_group_name
#  subnet_ids      = module.web_app_vpc.public_subnet_ids
#}

###########################################################
############ TODO_Application ############################
###########################################################
#module "todo_application" {
#  source = ""
#}


##################################################################
############ Sample Web Application ##############################
####################################################################
#module "ec2_instance" {
#  source = "./Modules/ec2/"
#  ec2_instance_type = "t2.micro"
#  ec2_subnets = "subnet-0729ac3b38ac28bf0"
#}