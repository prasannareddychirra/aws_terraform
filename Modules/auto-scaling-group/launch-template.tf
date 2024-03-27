resource "aws_launch_template" "cps_ptfe_launch_template" {
  name                    = var.launch_template_name
  vpc_security_group_ids  = [aws_security_group.ptfe_instance_security_group.id]
  disable_api_termination = var.disable_api_termination
  ebs_optimized           = var.ebs_optimized
  image_id                = var.image_id
  instance_type           = var.instance_type
  user_data               = base64encode(var.user_data)
  iam_instance_profile {
    name = var.iam_instance_profile_name
  }
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      encrypted   = true
      volume_size = 100
      volume_type = "gp3"
      iops        = 3000
    }
  }
  monitoring {
    enabled = false
  }
  tag_specifications {
    resource_type = "volume"
    tags          = merge(var.mandatory_tags, tomap({ (var.tag_definitions["resource-type"]) = "EBS", "Name" = "cps-terraform-${var.environment}" }))
  }
  tag_specifications {
    resource_type = "instance"
    tags          = merge(var.mandatory_tags, tomap({ (var.tag_definitions["resource-type"]) = "EC2", "Name" = "cps-terraform-${var.environment}" }))
  }
  tags = merge(var.mandatory_tags, tomap({ (var.tag_definitions["resource-type"]) = "LC", "Name" = "cps-terraform-${var.environment}" }))
  lifecycle {
    create_before_destroy = false
  }
}