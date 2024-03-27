#########################################################################
################## Common Variables######################################
#########################################################################
variable "application_name" {
  description = "Name of the project to be prefixed to create the s3 bucket"
  type        = string
}
variable "mandatory_tags" {
  description = "mandatory_tags to be associated with the S3 bucket"
  type        = map(any)
}
variable "environment" {
  description = "Type of Environment"
  type        = string
}
variable "tag_definitions" {
  type = map(any)
  default = {
    "resource-type" = "resource-type"
  }
  description = "Tag definitions for ease of maintenance"
}

variable "kms_key_id" {

  type        = string
  description = ""
}

variable "default_availability_zones" {
  type    = set(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

##################################################################################
################## Redis Cluster Variables #######################################
##################################################################################
variable "cluster_name" {
  type = string
}
variable "redis_cluster_engine" {
  type = string
}
variable "redis_num_cache_nodes" {
  type = string
}
variable "redis_engine_port" {
  type = string
}
//variable "redis_az_mode" {
//  type = string
//}
variable "redis_security_group_name" {
  type = string
}
//variable "redis_instance_security_group_name" {
//  type = string
//}
variable "parameter_group_name" {
  type        = string
  description = "(Required) The name of the ElastiCache parameter group."
}

variable "subnet_group_name" {
  type        = string
  description = "(Required) Name of the subnet group to be used for the cache cluster."
}

variable "security_group_name" {
  type        = string
  description = "(Optional) \"Default : null\". Required when create_securitygroup is true.The name of the security group."
}

variable "vpc_id" {
  type        = string
  description = "(Optional) \"Default : null\". Required when create_securitygroup is true. AWS virtual private cloud network used for production communication"
}

variable "apply_immediately" {
  type        = bool
  description = "(Optional) \"Default : false\". Specifies whether any modifications are applied immediately, or during the next maintenance window. Default is false."
}


variable "redis_node_type" {
  type        = string
  description = "(Required) Instance type to use for creating the Redis cache clusters"
}

variable "redis_port" {
  type        = string
  description = "(Optional) \"Default : 0\". Required when create_securitygroup is true. The port number on which each of the cache nodes will accept connections."
  default     = 0
}

variable "subnets" {
  type        = any
  description = "(Required) List of VPC Subnet IDs for the cache subnet group"
}

# might want a map
variable "redis_version" {
  type        = string
  description = "(Required) Redis version to use, defaults to 3.2.10"
}

variable "auto_minor_version_upgrade" {
  type        = bool
  description = "(Optional) \"Default : false\". Specifies whether minor version engine upgrades will be applied automatically to the underlying Cache Cluster instances during the maintenance window. Only supported for engine type redis and if the engine version is 6 or higher. Defaults to false."
}

variable "multi_az_enabled" {
  type        = bool
  description = "(Optional) \"Default : false\". Specifies whether to enable Multi-AZ Support for the replication group.Default it is false."
}

variable "redis_pg_family" {
  type = string
}
variable "ptfe_rds_database_sg" {
  type = string
}

variable "rest_encryption" {
  type = string
}
variable "failover_enabled" {
  type = string
}
variable "encryption_in_transit" {
  type = string
}
variable "redis_auth_token" {
  type = string
}
variable "maintenance_window" {
  type = string
}
variable "redis_snapshot_window" {
  type = string
}
variable "final_snapshot_identifier" {
  type = string
}
variable "snapshot_name" {
  type = string
}
variable "redis_cloudwatch_loggroup" {
  type = string
}
variable "log_destination_type" {
  type = string
}
variable "redis_log_format" {
  type = string
}
variable "redis_log_type" {
  type = string
}
variable "redis_snapshot_retention_limit" {
  type = string
}

variable "redis_engine_log_type" {
  type = string
}

variable "ptfe_instance_sg_id" {
  type = string
}