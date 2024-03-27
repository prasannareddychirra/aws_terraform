resource "aws_security_group" "ptfe_app_alb_security_group" {
  name        = "${var.alb_application_sg_name}-${var.environment}"
  description = "Allow access to services from LB traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    description = "VPC CIDR"
    cidr_blocks = ["10.0.0.0/8", "30.0.0.0/8", "10.124.248.0/22"]
  }
  tags = merge(var.mandatory_tags, tomap({ (var.tag_definitions["resource-type"]) = "SG" }))
}