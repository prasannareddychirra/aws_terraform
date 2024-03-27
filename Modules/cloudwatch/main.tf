resource "aws_cloudwatch_log_group" "cps_terraform_cw_lg" {
  name              = var.cloudwatch_loggroup_name
  retention_in_days = var.retention_in_days
  kms_key_id        = var.kms_key_arn
  tags              = merge(var.mandatory_tags, tomap({ (var.tag_definitions["resource-type"]) = "CW" }))
}

resource "aws_cloudwatch_log_stream" "cps_terraform_cw_ls" {
  log_group_name = aws_cloudwatch_log_group.cps_terraform_cw_lg.id
  name           = var.cloudwatch_log_stream_name
}

resource "aws_cloudwatch_dashboard" "cps_terraform_cw_dashboard" {
  count          = var.create_dashboard ? 1 : 0
  dashboard_body = var.dashboard_body
  dashboard_name = var.dashboard_name
}

resource "aws_cloudwatch_metric_alarm" "cps_terraform_cw_metric_alarm" {
  count                     = var.create_alarm ? 1 : 0
  alarm_name                = var.cloudwatch_alarm_name
  comparison_operator       = var.comparison_operator
  evaluation_periods        = var.evaluation_periods
  metric_name               = var.metric_name
  namespace                 = var.namespace
  period                    = var.period
  statistic                 = var.extended_statistic == "" ? null : var.statistic
  threshold                 = var.threshold
  alarm_description         = "This metric monitors ec2 cpu utilization"
  insufficient_data_actions = var.insufficient_data_actions
  tags                      = merge(var.mandatory_tags, tomap({ (var.tag_definitions["resource-type"]) = "CW" }))
}