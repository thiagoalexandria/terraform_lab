variable "ec2_tags" {
    type = map(any)
    default = {
      Name = "LAB-NGINX"
      Environment = "LAB"
      Departamento = "DevOps"
    }
}

variable "alb_tags" {
    type = map(any)
    default = {
      Name = "LAB-ALB-NGINX"
      Environment = "LAB"
      Departamento = "DevOps"
    }
}

variable "tg_tags" {
    type = map(any)
    default = {
      Name = "lab-app-lb-tg"
      Environment = "LAB"
      Departamento = "DevOps"
    }
}