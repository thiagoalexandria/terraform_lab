data "aws_subnet" "sub1" {
  filter {
    name   = "tag:Name"
    values = ["lab-us-east-1a"]
  }
}

data "aws_subnet" "sub2" {
  filter {
    name   = "tag:Name"
    values = ["lab-us-east-1b"]
  }
}

data "aws_vpc" "app" {
  filter {
    name   = "tag:Name"
    values = ["vpc-app"]
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

data "aws_iam_role" "ssm_role" {
  name = "Ec2RoleSSM"
}

data "aws_route53_zone" "thiago" {
  name = "thiago.click."
}