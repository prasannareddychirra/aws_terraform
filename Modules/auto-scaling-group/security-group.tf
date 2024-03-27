resource "aws_security_group" "ptfe_instance_security_group" {
  name        = var.instance_security_group_name
  description = "Allow access to services from LB traffic"
  vpc_id      = var.vpc_id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(var.mandatory_tags, tomap({ (var.tag_definitions["resource-type"]) = "SG" }))
}


resource "aws_security_group_rule" "ptfe_instance_security_group_alb_rule" {
  type              = "ingress"
  from_port         = 8800
  to_port           = 8800
  protocol          = "tcp"
  security_group_id = aws_security_group.ptfe_instance_security_group.id
  source_security_group_id = var.ptfe_lb_sg_id
}

resource "aws_security_group_rule" "ptfe_instance_security_group_vault_rule" {
  type              = "ingress"
  from_port         = 8201
  to_port           = 8201
  protocol          = "tcp"
  security_group_id = aws_security_group.ptfe_instance_security_group.id
  source_security_group_id = var.ptfe_lb_sg_id
}

resource "aws_security_group_rule" "ptfe_instance_security_group_alb_2_rule" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.ptfe_instance_security_group.id
  source_security_group_id = var.ptfe_lb_sg_id
}

resource "aws_security_group_rule" "ptfe_instance_security_group_redis_rule" {
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  security_group_id = aws_security_group.ptfe_instance_security_group.id
  source_security_group_id = var.redis_sg_id
}

resource "aws_security_group_rule" "ptfe_instance_security_group_rds_rule" {
  type              = "ingress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  security_group_id = aws_security_group.ptfe_instance_security_group.id
  source_security_group_id = var.rds_database_sg_id
}

resource "aws_security_group_rule" "ptfe_instance_security_group_internal_cidr_rule" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks = ["10.0.0.0/8", "30.0.0.0/8", "10.124.248.0/22"]
  security_group_id = aws_security_group.ptfe_instance_security_group.id
}