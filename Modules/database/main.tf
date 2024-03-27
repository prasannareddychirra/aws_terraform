
resource "aws_rds_cluster" "cps_terraform_rds_cluster" {
  cluster_identifier              = var.cluster_identifier
  engine_version                  = var.engine_version
  master_username                 = var.db_cluster_username
  master_password                 = var.db_cluster_password
  database_name                   = var.database_name
  port                            = 5432
  availability_zones              = var.default_availability_zones
  engine                          = var.engine
  engine_mode                     = var.engine_mode
  storage_encrypted               = var.storage_encryption
  vpc_security_group_ids          = [aws_security_group.ptfe_db_sg.id]
  db_subnet_group_name            = aws_db_subnet_group.cps_terraform_rds_subnet_group.name
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.cps_terraform_rds_parameter_group.name
  deletion_protection             = true
  kms_key_id                      = var.db_kms_key_id
  enabled_cloudwatch_logs_exports = ["postgresql"]
  apply_immediately               = true
  allow_major_version_upgrade     = false
  copy_tags_to_snapshot           = true
  skip_final_snapshot             = true
  final_snapshot_identifier       = var.cluster_identifier
  lifecycle {
    ignore_changes = [
      scaling_configuration,
    ]
  }
  tags = merge(var.mandatory_tags, tomap({ (var.tag_definitions["resource-type"]) = "RDS" }))
}

resource "aws_rds_cluster_instance" "cps_terraform_rds_instance" {
  count                      = 2
  promotion_tier             = 2
  identifier                 = "${var.cluster_instance_identifier}-${count.index}"
  cluster_identifier         = aws_rds_cluster.cps_terraform_rds_cluster.cluster_identifier
  instance_class             = var.db_cluster_instance_type
  engine                     = aws_rds_cluster.cps_terraform_rds_cluster.engine
  engine_version             = aws_rds_cluster.cps_terraform_rds_cluster.engine_version
  db_subnet_group_name       = aws_db_subnet_group.cps_terraform_rds_subnet_group.name
  db_parameter_group_name    = aws_db_parameter_group.cps_terraform_rds_instance_parameter_group.name
  apply_immediately          = true
  auto_minor_version_upgrade = false
  copy_tags_to_snapshot      = true
  tags                       = merge(var.mandatory_tags, tomap({ (var.tag_definitions["resource-type"]) = "RDS" }))
}

resource "aws_db_parameter_group" "cps_terraform_rds_instance_parameter_group" {
  name   = "cps-terraform-db-instance-parameter-group"
  family = "aurora-postgresql14"
  tags   = merge(var.mandatory_tags, tomap({ (var.tag_definitions["resource-type"]) = "RDS" }))
}

resource "aws_rds_cluster_parameter_group" "cps_terraform_rds_parameter_group" {
  name        = var.rds_cluster_parameter_group_name
  family      = "aurora-postgresql14"
  description = "RDS default cluster parameter group"

  parameter {
    name         = "pgaudit.role"
    value        = "rds_pgaudit"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "shared_preload_libraries"
    value        = "pgaudit,pg_stat_statements"
    apply_method = "pending-reboot"
  }
  parameter {
    name         = "log_disconnections"
    value        = 1
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "log_min_duration_statement"
    value        = 1200000
    apply_method = "pending-reboot"
  }
  parameter {
    name         = "log_connections"
    value        = 1
    apply_method = "pending-reboot"
  }
  parameter {
    name         = "log_duration"
    value        = 1
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "log_error_verbosity"
    value        = "verbose"
    apply_method = "pending-reboot"
  }
  parameter {
    name         = "pgaudit.log"
    value        = "All"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "rds.log_retention_period"
    value        = 1440
    apply_method = "pending-reboot"
  }
  tags = merge(var.mandatory_tags, tomap({ (var.tag_definitions["resource-type"]) = "RDS" }))
}

resource "aws_db_subnet_group" "cps_terraform_rds_subnet_group" {
  name       = var.rds_cluster_subnet_group_name
  subnet_ids = var.subnets
  tags       = merge(var.mandatory_tags, tomap({ (var.tag_definitions["resource-type"]) = "RDS" }))
}

resource "aws_db_option_group" "cps_terraform_rds_option_group" {
  name                     = var.rds_cluster_options_group_name
  option_group_description = "Terraform Option Group"
  engine_name              = var.engine
  major_engine_version     = var.subnet_group_engine_version
}