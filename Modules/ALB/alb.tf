resource "aws_lb" "app" {
  name               = var.alb_name
  internal           = var.alb_internal
  load_balancer_type = var.alb_type
  security_groups    = var.alb_security_groups
  subnets            = var.subnets

  enable_deletion_protection = var.alb_deletion_protection

  tags = var.alb_tags
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.app.arn
  port              = "443"
  protocol          = "HTTPS"

  default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
}