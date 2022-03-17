resource "aws_security_group" "acess_app" {
  name        = "acess_app"
  description = "Allow traffic"
  vpc_id      = data.aws_vpc.app.id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "acess_app"
  }
}

resource "aws_security_group_rule" "http" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.acess_app.id
  security_group_id        = aws_security_group.acess_app.id
}

resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.acess_app.id
}