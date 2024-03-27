output "application_lb_arn" {
  value       = aws_lb.cps_ptfe_alb_app.arn
  description = "The ARN of the Application Load Balancer arn"
}

output "application_lb_security_group_arn" {
  value = aws_security_group.ptfe_app_alb_security_group.arn
}

output "application_lb_security_group_id" {
  value = aws_security_group.ptfe_app_alb_security_group.id
}

output "application_lb_target_arn" {
  value = aws_lb_target_group.cps_ptfe_tg.arn
}
output "application_lb_target_id" {
  value = aws_lb_target_group.cps_ptfe_tg.id
}