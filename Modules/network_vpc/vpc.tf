#########################################################################
# Create a VPC
#########################################################################
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr #10.10.1.0/24 #10.10.2.0/24
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = {
    Name = var.vpc_name
  }
}

##########################################################################
########## Create subnets#################################################
##########################################################################

resource "aws_subnet" "public_subnet" {
  count             = length(var.public_subnet_cidr_blocks)
  vpc_id            = aws_vpc.main.id
  map_public_ip_on_launch = true
  cidr_block        = var.public_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "${var.public_subnet_name}${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnet" {
  count = length(var.private_subnet_cidr_block)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr_block[count.index]
  availability_zone = var.availability_zones[count.index]  # Assuming you want to place in the first AZ
  tags = {
    Name = "${var.private_subnet_name}${count.index +1}"
  }
}

################################################################
# Create a Public Route Table
################################################################

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public_route_table"
  }
}
resource "aws_route_table_association" "public_subnet_association" {
  count          = length(aws_subnet.public_subnet)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "private_route_table"
  }
}

resource "aws_route_table_association" "private_subnet_association" {
  count          = length(aws_subnet.private_subnet)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}

#####################################################################
# Create an Internet Gateway
#####################################################################
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.vpc_name}-igw"
  }
}
## Create an Elastic IP for the NAT Gateway
#resource "aws_eip" "nat" {
#  for_each = aws_subnet.subnet_private
#  domain   = "vpc"
#  tags = {
#    Name = "${var.vpc_name}-nat-eip"
#  }
#}
#
## Create a NAT Gateway
#resource "aws_nat_gateway" "nat" {
#  for_each = aws_subnet.subnet_private
#
#  allocation_id = aws_eip.nat[each.key].id  # Ensure you have an EIP for each NAT Gateway
#  subnet_id     = each.value.id
#
#  tags = {
#    Name = "NATGateway-${each.key}"
#  }
#}





