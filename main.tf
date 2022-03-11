provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "sourcegraph" {
  ami           = "ami-0e1d30f2c40c4c701"
  instance_type = "t2.micro"
  subnet_id = "subnet-9a901c94"
  security_groups = ["sg-0dd90a97a75f3d290"]
  iam_instance_profile = "Ec2RoleSSM"

  tags = {
    Name = "HelloWorld"
  }
}