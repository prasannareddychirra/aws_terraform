resource "aws_security_group" "cps_terraform_redis_sg" {
  name        = var.redis_security_group_name
  description = "Allow DB access tp the PTFE DB"
  vpc_id      = var.vpc_id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(var.mandatory_tags, tomap({ "resource-type" = "SG" }))
}

resource "aws_security_group_rule" "cps_terraform_rds_sg_rule" {
  type                     = "ingress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  security_group_id        = aws_security_group.cps_terraform_redis_sg.id
  source_security_group_id = var.ptfe_rds_database_sg
}

resource "aws_security_group_rule" "cps_terraform_instance_sg_rule" {
  type                     = "ingress"
  from_port                = 6379
  to_port                  = 6379
  protocol                 = "tcp"
  security_group_id        = aws_security_group.cps_terraform_redis_sg.id
  source_security_group_id = var.ptfe_instance_sg_id
}

resource "aws_security_group_rule" "cps_terraform_redis_sg_rule" {
  type                     = "ingress"
  from_port                = 7480
  to_port                  = 7480
  protocol                 = "tcp"
  security_group_id        = aws_security_group.cps_terraform_redis_sg.id
  source_security_group_id = var.ptfe_instance_sg_id
}

resource "aws_security_group_rule" "cps_terraform_instance2_sg_rule" {
  type                     = "ingress"
  from_port                = 8201
  to_port                  = 8201
  protocol                 = "tcp"
  security_group_id        = aws_security_group.cps_terraform_redis_sg.id
  source_security_group_id = var.ptfe_instance_sg_id
}

resource "aws_security_group_rule" "cps_terraform_internal_sg_rule" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  security_group_id = aws_security_group.cps_terraform_redis_sg.id
  cidr_blocks       = ["10.0.0.0/8", "30.0.0.0/8", "10.124.248.0/22", "33.0.0.0/8"]
}

resource "aws_security_group_rule" "cps_terraform_sg_icmp_rule" {
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  security_group_id = aws_security_group.cps_terraform_redis_sg.id
  cidr_blocks       = ["10.0.0.0/8", "30.0.0.0/8", "10.124.248.0/22", "33.0.0.0/8"]
}