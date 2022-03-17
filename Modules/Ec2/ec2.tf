resource "aws_instance" "instance" {
  ami                  = var.ec2_ami
  instance_type        = var.ec2_instance_type
  subnet_id            = var.subnet_id
  security_groups      = var.security_groups
  iam_instance_profile = var.ec2_instance_profile

  user_data = file("setup.sh")

  tags = var.ec2_tags
}

