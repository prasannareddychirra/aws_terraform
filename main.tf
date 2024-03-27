##### VPC Module ##########
#module "vpc" {
#  source = "./Modules/network_vpc"
#  vpc_cidr           = "10.1.0.0/24"
#  vpc_name           = "webapp"
##  subnet_cidr_blocks = ["10.1.0.0/26", "10.1.0.64/26","10.1.0.128/26","10.1.0.192/26"]
#  public_subnets  = ["10.10.1.0/24", "10.10.2.0/24"]
#  private_subnets = ["10.10.3.0/24", "10.10.4.0/24"]
#  availability_zones = ["us-east-1a", "us-east-1b","us-east-1c"]
#  subnet_cidr_blocks = []
#}

module "web_app_vpc" {

  source = "./Modules/network_vpc"
  availability_zones = []
  private_subnet_cidr_block = ""
  private_subnet_name = ""
  public_subnet_cidr_blocks = []
  public_subnet_name = ""
  vpc_cidr = ""
  vpc_name = ""
}