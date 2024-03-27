##############################################################
################ Common Variables#############################
##############################################################
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
variable "default_availability_zones" {
  type = set(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

#############################################################
############### Database Variables ##########################
#############################################################
variable "engine_mode" {
  type = string
  description = ""
}
variable "cluster_identifier" {
  type = string
  description = ""
}
variable "cluster_instance_identifier" {
  type = string
}
variable "engine" {
  type = string
  description = ""
}
variable "engine_version" {
  type = string
  description = ""
}
variable "db_cluster_username" {
  type = string
  description = ""
}
variable "db_cluster_password" {
  type = string
  description = ""
}
variable "db_cluster_instance_type" {
  type = string
  description = ""
}
variable "db_cluster_storage_type" {
  type = string
  description = ""
}
variable "db_cluster_allocated_storage" {
  type = string
  description = ""
}

variable "storage_encryption" {
  type = string
  description = ""
}
variable "subnets" {
  type = any
  description = ""
}
variable "database_name" {
  type = string
  description = ""
}
variable "rds_cluster_subnet_group_name" {
  type = string
  description = ""
}
variable "rds_cluster_parameter_group_name" {
  type = string
  description = ""
}
//variable "db_security_group" {
//  type = string
//  description = ""
//}
variable "db_kms_key_id" {
  type = string
  description = ""
}

variable "rds_cluster_options_group_name" {
  type = string
}
variable "subnet_group_engine_version" {
  type = string
}
###########################################################################################
###################### Security Group Variables ##########################################
###########################################################################################
variable "database_security_group_name" {
  type        = string
  description = "Name of the Database Security Group"
}
variable "vpc_id" {
  type        = string
  description = "VPC Id of the target account"
}
variable "ptfe_instance_sg_id" {
  type        = string
  description = ""
}
variable "redis_security_group_id" {
  type        = string
}