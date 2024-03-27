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
variable "kms_key_arn" {
  description = "ARN of KMS key for encryption"
  type        = string
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
###############################################################################
################## Cloud Watch Log Group#######################################
###############################################################################
variable "cloudwatch_loggroup_name" {
  description = "The name of the log group. Must not be longer than 512 characters and must not contain :"
  type = string
}
variable "retention_in_days" {
  description = "Number of days you want to retain log events in the log group"
  type = string
}
###############################################################################
###################### Cloudwatch Log Stream###################################
###############################################################################
//variable "logstream_group_name" {
//  description = "The name of the log group. Must not be longer than 512 characters and must not contain :"
//  type = string
//}
variable "cloudwatch_log_stream_name" {
  description = "The name of the log stream. Must not be longer than 512 characters and must not contain :"
  type = string
}

###############################################################################
#################### Dashboard ################################################
###############################################################################
variable "dashboard_body" {
  description = "The detailed information about the dashboard, including what widgets are included and their location on the dashboard"
  type        = string
}
variable "dashboard_name" {
  description = "The name of the dashboard."
  type = string
}
variable "create_dashboard" {
  type = bool
}
#################################################################################
#################### Metrics ###################################################
#################################################################################
variable "create_alarm" {
  description = "A boolean that indicates whether to create Cloud Watch log metrics or not. Default is true"
  type = string
}
variable "cloudwatch_alarm_name" {
  description = "(Required) The descriptive name for the alarm. This name must be unique within the user's AWS account."
  type = string
}
variable "comparison_operator" {
  description = "(Required) The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand. Either of the following is supported: GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold. Additionally, the values LessThanLowerOrGreaterThanUpperThreshold, LessThanLowerThreshold, and GreaterThanUpperThreshold are used only for alarms based on anomaly detection models."
  type = string
}
variable "evaluation_periods" {
  description = "(Required) The number of periods over which data is compared to the specified threshold."
  type = string
}
variable "metric_name" {
  description = "(Optional) \"Default : null\". The name for the alarm's associated metric. See docs for supported metrics."
  type = string
}
variable "namespace" {
  description = "(Optional) \"Default : null\". The namespace for the alarm's associated metric. See docs for the list of namespaces. See docs for supported metrics."
  type = string
}
variable "period" {
  description = "(Optional) \"Default : null\". The period in seconds over which the specified statistic is applied."
  type = string
}
variable "extended_statistic" {
  description = "(Optional) \"Default : null\". The percentile statistic for the metric associated with the alarm. Specify a value between p0.0 and p100."
  type = string
}
variable "statistic" {
  description = "(Optional) \"Default : null\". The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum."
  type = string
}
variable "threshold" {
  description = "(Optional) \"Default : null\". The value against which the specified statistic is compared. This parameter is required for alarms based on static thresholds, but should not be used for alarms based on anomaly detection models."
  type = string
}
variable "insufficient_data_actions" {
  description = "(Optional) \"Default : null\". The list of actions to execute when this alarm transitions into an INSUFFICIENT_DATA state from any other state. Each action is specified as an Amazon Resource Name (ARN)."
  type = set(string)
}