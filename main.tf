provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "sourcegraph" {
  ami                  = data.aws_ami.amazon_linux.id
  instance_type        = "t2.micro"
  subnet_id            = data.aws_subnet.sub1.id
  security_groups      = [aws_security_group.acesso_sourcegraph.id]
  iam_instance_profile = data.aws_iam_role.ssm_role.name

  user_data = file("setup.sh")

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_security_group" "acesso_sourcegraph" {
  name        = "acesso_sourcegraph"
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
    Name = "acesso_sourcegraph"
  }
}

resource "aws_security_group_rule" "http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.acesso_sourcegraph.id
}

resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.acesso_sourcegraph.id
}

resource "aws_security_group_rule" "https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.acesso_sourcegraph.id
}

resource "aws_route53_record" "app" {
  zone_id = data.aws_route53_zone.thiago.zone_id
  name    = "app.thiago.click"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.sourcegraph.public_ip]
}