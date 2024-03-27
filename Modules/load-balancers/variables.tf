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

###########################################################################################
###################### Security Group Variables ##########################################
###########################################################################################
variable "alb_application_sg_name" {
  type        = string
  description = "Name of the Security Group"
}
variable "vpc_id" {
  type        = string
  description = "VPC Id of the target account"
}

variable "subnets" {
  type        = any
  description = "List of subnets to launch services into"
}
##########################################################################################
######################## Load Balancers Variables ########################################
##########################################################################################
variable "app_cert_arn" {
  type        = string
  description = "Name of the KMS key arn for SSL encryption"
}
variable "application_lb_name" {
  type        = string
  description = "Name Of the Application Load Balancer"
}
variable "application_target_group_name" {
  type        = string
  description = "Name of the target group Name"
}
