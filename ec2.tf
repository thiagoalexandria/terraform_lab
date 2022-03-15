resource "aws_instance" "sourcegraph" {
  ami                  = "ami-0731f00285fe96df3"
  instance_type        = "t2.micro"
  subnet_id            = data.aws_subnet.sub1.id
  security_groups      = [aws_security_group.acesso_sourcegraph.id]
  iam_instance_profile = data.aws_iam_role.ssm_role.name

  user_data = file("setup.sh")

  tags = var.ec2_tags
}

