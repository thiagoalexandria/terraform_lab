provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source = "./Modules/Ec2"

  ec2_ami              = data.aws_ami.amazon_linux.name
  ec2_instance_type    = "t3a.micro"
  ec2_instance_profile = data.aws_iam_role.ssm_role.name
  subnet_id            = data.aws_subnet.sub1.id
  security_groups      = [aws_security_group.acess_app.id]
  ec2_tags             = var.ec2_tags
}

module "alb" {
  source = "./Modules/ALB"

  alb_name            = var.app_name
  alb_internal        = false
  alb_type            = "application"
  alb_security_groups = tolist([aws_security_group.acess_app.id, aws_security_group.alb_sg.id])
  subnets             = tolist([data.aws_subnet.sub1.id, data.aws_subnet.sub2.id])
  alb_tags            = var.alb_tags
  target_group_arn    = module.tg.tg_arn
}

module "tg" {
  source = "./Modules/TG"

  tg_name           = var.app_name
  app_port          = 80
  app_protocol          = "HTTP"
  vpc_id            = data.aws_vpc.app.id
  health_check_path = "/"
  tg_tags           = var.tg_tags
  instance_id       = module.ec2_instance.instance_id
}