output "auto_scaling_group_id" {
  value = aws_autoscaling_group.cps_ptfe_autoscaling_group.id
}

output "asg_instance_sg_id" {
  value = aws_security_group.ptfe_instance_security_group.id
}

output "asg_instance_sg_name" {
  value = aws_security_group.ptfe_instance_security_group.name
}