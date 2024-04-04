data "aws_ami" "amazon_linux_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.4.20240401.1-kernel-6.1-x86_64"]
  }
}

resource "aws_instance" "amazon_ec2_instance" {
  ami           = data.aws_ami.amazon_linux_ami.id
  instance_type = var.ec2_instance_type
  subnet_id     = var.ec2_subnets
  tags = {
    Name = "web_app"
  }
}
