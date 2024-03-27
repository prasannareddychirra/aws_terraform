resource "aws_lb" "cps_ptfe_alb_app" {
  name               = var.application_lb_name
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ptfe_app_alb_security_group.id]
  subnets            = var.subnets
  enable_deletion_protection = true
  tags = merge(var.mandatory_tags, tomap({ (var.tag_definitions["resource-type"]) = "ALB" }))
}

resource "aws_lb_listener" "cps_ptfe_lb_80_listener" {
  load_balancer_arn = aws_lb.cps_ptfe_alb_app.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "cps_ptfe_lb_443_listener" {
  load_balancer_arn = aws_lb.cps_ptfe_alb_app.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = var.app_cert_arn
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.cps_ptfe_tg.arn
  }
}

resource "aws_lb_target_group" "cps_ptfe_tg" {
  name = var.application_target_group_name
  port        = 443
  protocol    = "HTTPS"
  vpc_id      = var.vpc_id

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    protocol            = "HTTPS"
    path                = "/_health_check"

  }
  tags = merge(var.mandatory_tags, tomap({ "resource-type" = "ALB" }))
}

resource "aws_lb_listener_rule" "ptfe_lb_listener_rule" {
  listener_arn = aws_lb_listener.cps_ptfe_lb_80_listener.arn
  priority     = 100
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.cps_ptfe_tg.arn
  }
  condition {
    path_pattern {
      values = ["*"]
    }
  }
}