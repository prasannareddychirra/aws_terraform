#####################################################################
################# New Variables ####################################
########VPC#################
vpc_cidr = "10.0.0.0/16"
vpc_name = "Webapp"
enable_dns_support = true
enable_dns_hostnames = true
subnet_cidr_blocks = ""
availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
map_public_ip_on_launch = ""
public_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnets = "10.0.4.0/24"
public_subnet_name = "web_app_public_subnet"
private_subnet_name = "web_app_private_subnet"
#################################################################
################### Common Variable Values ######################
#################################################################
#s3_kms_id                  = "arn:aws:kms:us-east-1:916044042746:key/f3ed0544-980f-44e1-a8e4-7c1098709afb"
#cw_kms_id                  = "arn:aws:kms:us-east-1:916044042746:key/d88b744f-7b96-435b-9aa4-74a952889f7a"
#environment                = "dev"
#environment_type           = "active"
#vpc_id                     = "vpc-05de373c2f7e066c9"
#kms_key_arn                = "arn:aws:kms:us-east-1:916044042746:key/60b4026b-b6eb-428f-9b5e-00a937dc401d"
#account_id                 = "916044042746"
#assume_role_name           = "tfe-dev-assumerole"
#dockerusername             = "prasi0111"
#application_name           = "Terraform-Enterprise"
#default_availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
#################################################################
####### Mandatory Tags Values####################################
#################################################################
#PatchGroup           = "Default"
#PatchWindow          = "Default"
#workspace            = "TFE-Enterprise"
#app-servicenow-group = "Anthem Cloud Reimagined Support"
#app-support-dl       = "dl-LegatoCpmsAutomation@legato.com"
#application-name     = "Terraform-Enterprise"
#apm-id               = "APM1007416"
#business-division    = "CORP"
#app-business-owner   = "Ramachandran Karthik"
#barometer-it         = "041800001M1L"
#company-name         = "Elevance Health"
#compliance           = "Confidential"
#costcenter           = "6590215400"
#sdlc                 = "dev"
#owner_department     = "Cloud Platform Services"
#schedule_window      = "mon-fri-8am-6pm-est"
##################################################################
########################## IAM Values ############################
#ptfe_role             = "cps-terraform-instance-role"
#instance_profile_name = "cps-terraform-instance-profile"
###############################################################
##################### ASG Variable Values######################
###############################################################
#asg_desired_size      = 1
#asg_instance_name     = "cps-ptfe-asg-instance"
#asg_max_size          = 4
#asg_min_size          = 1
#asg_name_prefix       = "cps-ptfe-terraform-asg"
#ami_id                = "ami-0552f389f498c7a59"
#instance_type         = "m5.12xlarge"
#ptfe_release_sequence = "676"
##################################################################
############## Load Balancers ####################################
##################################################################
#application_alb_security_group_name = "cps-terraform-alb-app-sg"
#alb_application_cert_arn            = "arn:aws:acm:us-east-1:916044042746:certificate/0292c619-148b-451b-af02-40aed2e27025"
#application_load_balancer_app_name  = "cps-ptfe-app-alb"
#alb_app_target_group_name           = "cps-ptfe-app-tg"
#
#####################################################################
################ Database ###########################################
#####################################################################
#rds_cluster_identifier      = "cps-terraform-db-cluster"
#cluster_instance_identifier = "cps-terraform-db-instance"
#aurora_db_name              = "ptfe"
#db_security_group_name      = "cps-terraform-db-aurora-sg"
#db_allocated_storage        = "100"
#db_instance_type            = "db.r5.xlarge"
#db_cluster_iops             = "1500"
#db_password                 = "cpstfeQ1%6&H"
#db_storage_type             = "io1"
#db_username                 = "postgres"
#db_kms_id                   = "arn:aws:kms:us-east-1:916044042746:key/3671bcdb-160a-4ed8-bf48-372d412bb503"
#db_engine                   = "aurora-postgresql"
#db_engine_mode              = "provisioned"
#db_engine_version           = "14.6"
#storage_encryption          = true
#db_parameter_group_name     = "cps-terraform-db-parameter-group"
#db_subnet_group_name        = "cps-terraform-db-subnet-group"
#rds_option_group_name       = "cps-terraform-db-options-group"
#db_engine_opt_version       = "14"
##########################################################################
######################### Redis Database##################################
##########################################################################
#apply_immediately               = true
#encryption_at_rest              = true
#encryption_at_transit           = true
#engine_log_type                 = "engine-log"
#failover_enabled                = true
#log_destination_type            = "cloudwatch-logs"
#log_format                      = "json"
#log_type                        = "slow-log"
#maintenance_window_time         = "sun:05:00-sun:09:00"
#minor_version_upgrade           = true
#multi_az                        = true
#redis_auth_token                = "redis#w0un2023=&"
#redis_az_mode                   = "cross-az"
#redis_cache_nodes               = "3"
#redis_cluster_name              = "cps-terraform-redis-cluster"
#redis_engine                    = "redis"
#redis_engine_version            = "6.2"
#redis_family_pg_version         = "redis6.x"
#redis_final_snapshot_identifier = "cps-terraform-redis-cluster-snapshot"
#redis_kms_key_arn               = "arn:aws:kms:us-east-1:916044042746:key/3671bcdb-160a-4ed8-bf48-372d412bb503"
#redis_node_type                 = "cache.r6g.large"
#redis_parameter_group_name      = "cps-terraform-redis-parameter-group"
#redis_port                      = "6379"
#redis_security_group_name       = "cps-terraform-redis-cluster-sg"
#redis_snapshot_retention_limit  = "7"
#redis_snapshot_window_time      = "09:00-11:00"
#redis_subnet_group_name         = "cps-terraform-redis-subnet-group-name"
#snapshot_name                   = ""
