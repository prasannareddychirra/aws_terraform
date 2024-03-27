resource "aws_autoscaling_group" "cps_ptfe_autoscaling_group" {
  name                      = var.asg_name
  max_size                  = var.asg_max_size
  min_size                  = var.asg_min_size
  desired_capacity          = var.asg_desired_size
  health_check_grace_period = 15
  default_cooldown          = 15
  health_check_type         = "EC2"
  force_delete              = true
  target_group_arns         = var.alb_target_arns
  vpc_zone_identifier       = var.subnets
  //  vpc_zone_identifier = var.subnets[0]
  launch_template {
    id      = aws_launch_template.cps_ptfe_launch_template.id
    version = aws_launch_template.cps_ptfe_launch_template.latest_version
  }
  provisioner "local-exec" {
    command = "sleep 10"
  }
  lifecycle {
    create_before_destroy = true
  }
  tags = concat(
    [
      {
        key                 = "Name"
        value               = "${var.asg_instance_name}-${var.environment}"
        propagate_at_launch = true
      }
    ],
    var.mandatory_tags_asg,
  )
}
