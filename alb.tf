resource "aws_lb" "app" {
  name               = "LAB-NGINX"
  internal           = false
  load_balancer_type = "application"
  security_groups    = tolist([aws_security_group.acesso_sourcegraph.id, aws_security_group.alb_sg.id])
  subnets            = tolist([data.aws_subnet.sub1.id, data.aws_subnet.sub2.id])

  enable_deletion_protection = false

  tags = var.alb_tags
}

resource "aws_lb_target_group" "app" {
  name     = "lab-app-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.app.id

  health_check {
    path = "/"
    port = 80
  }

  tags = var.tg_tags
}

resource "aws_lb_target_group_attachment" "app" {
  target_group_arn = aws_lb_target_group.app.arn
  target_id        = aws_instance.sourcegraph.id
  port             = 80
}

resource "aws_lb_listener" "app" {
  load_balancer_arn = aws_lb.app.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }
}