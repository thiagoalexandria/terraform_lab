resource "aws_lb_target_group" "app" {
  name     = var.tg_name
  port     = var.app_port
  protocol = var.app_protocol
  vpc_id   = var.vpc_id

  health_check {
    path = var.health_check_path
    port = var.app_port
  }

  tags = var.tg_tags
}

resource "aws_lb_target_group_attachment" "app" {
  target_group_arn = aws_lb_target_group.app.arn
  target_id        = var.instance_id
  port             = var.app_port
}