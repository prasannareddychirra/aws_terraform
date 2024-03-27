//resource "aws_elasticache_cluster" "cps_terraform_redis_cluster" {
//  count                = 1
//  cluster_id           = "${var.cluster_name}-${count.index}"
//  replication_group_id = aws_elasticache_replication_group.cps_terraform_redis_replication_group.id
//  apply_immediately    = true
//  tags           = merge(var.mandatory_tags, tomap({ (var.tag_definitions["resource-type"]) = "Redis" }))
//}

resource "aws_elasticache_replication_group" "cps_terraform_redis_replication_group" {
  apply_immediately             = var.apply_immediately
  at_rest_encryption_enabled    = var.rest_encryption
  auth_token                    = var.redis_auth_token
  auto_minor_version_upgrade    = var.auto_minor_version_upgrade
  automatic_failover_enabled    = var.failover_enabled
  engine                        = var.redis_cluster_engine
  engine_version                = var.redis_version
  kms_key_id                    = var.kms_key_id
  maintenance_window            = var.maintenance_window
  multi_az_enabled              = var.multi_az_enabled
  node_type                     = var.redis_node_type
  num_cache_clusters            = var.redis_num_cache_nodes
  parameter_group_name          = aws_elasticache_parameter_group.cps_terraform_redis_parameter_group.id
  port                          = var.redis_engine_port
  preferred_cache_cluster_azs   = var.default_availability_zones
  replication_group_description = "CPS Terraform Redis Group"
  replication_group_id          = var.cluster_name
  security_group_ids            = [aws_security_group.cps_terraform_redis_sg.id]
  snapshot_window               = var.redis_snapshot_window
  snapshot_retention_limit      = var.redis_snapshot_retention_limit
  final_snapshot_identifier     = var.final_snapshot_identifier
  snapshot_name                 = var.snapshot_name
  subnet_group_name             = aws_elasticache_subnet_group.cps_terraform_redis_subnet_group.id
  transit_encryption_enabled    = var.encryption_in_transit
  tags                          = merge(var.mandatory_tags, tomap({ (var.tag_definitions["resource-type"]) = "Redis" }))
  log_delivery_configuration {
    destination      = var.redis_cloudwatch_loggroup
    destination_type = var.log_destination_type
    log_format       = var.redis_log_format
    log_type         = var.redis_log_type
  }
  log_delivery_configuration {
    destination      = var.redis_cloudwatch_loggroup
    destination_type = var.log_destination_type
    log_format       = var.redis_log_format
    log_type         = var.redis_engine_log_type
  }
  lifecycle {
    ignore_changes = [number_cache_clusters]
  }
}


resource "aws_elasticache_parameter_group" "cps_terraform_redis_parameter_group" {
  name        = var.parameter_group_name
  family      = var.redis_pg_family
  description = "Redis default cluster parameter group"
  //
  //  parameter {
  //    name         = "pgaudit.role"
  //    value        = "rds_pgaudit"
  //    apply_method = "pending-reboot"
  //  }
  //
  //  parameter {
  //    name         = "shared_preload_libraries"
  //    value        = "pgaudit,pg_stat_statements"
  //    apply_method = "pending-reboot"
  //  }
  //  parameter {
  //    name         = "log_disconnections"
  //    value        = 1
  //    apply_method = "pending-reboot"
  //  }
  //
  //  parameter {
  //    name         = "log_min_duration_statement"
  //    value        = 1200000
  //    apply_method = "pending-reboot"
  //  }
  //  parameter {
  //    name         = "log_connections"
  //    value        = 1
  //    apply_method = "pending-reboot"
  //  }
  //  parameter {
  //    name         = "log_duration"
  //    value        = 1
  //    apply_method = "pending-reboot"
  //  }
  //
  //  parameter {
  //    name         = "log_error_verbosity"
  //    value        = "verbose"
  //    apply_method = "pending-reboot"
  //  }
  //  parameter {
  //    name         = "pgaudit.log"
  //    value        = "All"
  //    apply_method = "pending-reboot"
  //  }
  //
  //  parameter {
  //    name         = "rds.log_retention_period"
  //    value        = 1440
  //    apply_method = "pending-reboot"
  //  }
  tags = merge(var.mandatory_tags, tomap({ (var.tag_definitions["resource-type"]) = "Redis" }))
}

resource "aws_elasticache_subnet_group" "cps_terraform_redis_subnet_group" {
  name       = var.subnet_group_name
  subnet_ids = var.subnets
  tags       = merge(var.mandatory_tags, tomap({ (var.tag_definitions["resource-type"]) = "Redis" }))
}