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
variable "mandatory_tags_asg" {
  type = any
}
//variable "kms_key_arn" {
//  description = "ARN of KMS key for encryption"
//  type        = string
//}
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
############################################################
########### Launch Template variables ######################
############################################################
variable "launch_template_name" {
  description = "Name of the Launch Template"
  type        = string
}
//variable "instance_security_group_ids" {
//  description = "Name of the Security Group that you want to attach to LT"
//  type = list(string)
//}
variable "disable_api_termination" {
  description = "Enable or Disable API termination"
  type        = bool
}
variable "iam_instance_profile_name" {
  description = "The IAM Instance Profile to launch the instance with"
  type        = string
}
variable "ebs_optimized" {
  description = "launched EC2 instance will be EBS-optimized."
  type        = bool
}
variable "image_id" {
  description = "The AMI from which to launch the instance."
  type        = string
}
variable "instance_type" {
  description = "The type of the instance."
  type        = string
}
variable "user_data" {
  description = "The base64-encoded user data to provide when launching the instance."
  type = string
}
###########################################################################################
###################### Security Group Variables ##########################################
###########################################################################################
variable "instance_security_group_name" {
  type        = string
  description = "Name of the Security Group"
}
variable "vpc_id" {
  type        = string
  description = "VPC Id of the target account"
}
variable "ptfe_lb_sg_id" {
  type        = string
  description = ""
}
variable "redis_sg_id" {
  type = string
}
variable "rds_database_sg_id" {
  type = string
}

###############################################################
############ ASG Variables ####################################
###############################################################
variable "subnets" {
  type        = set(string)
  description = "List of subnets to launch services into"
}
variable "alb_target_arns" {
  type = set(string)
}
variable "asg_name" {
  type = string
}
variable "asg_max_size" {
  description = "(Optional) \"Default : 1\" . The maximum size of the autoscale group"
  type = string
}
variable "asg_min_size" {
  description = "(Optional) \"Default : 1\" . The minimum size of the autoscale group"
  type = string
}
variable "asg_desired_size" {
  type = string
}
variable "asg_instance_name" {
  type = string
}
