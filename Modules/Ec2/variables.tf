variable "ec2_ami" {
    type = string
    description = "AMI utilizada na EC2"
}

variable "ec2_instance_type" {
    type = string
    description = "Familia da EC2"
}

variable "subnet_id" {
    type = string
    description = "Id da subnet que a EC2 será lançada"
}

variable "security_groups" {
    type = list(any)
    description = "Lista de security groups que serão utilizados"
}

variable "ec2_instance_profile" {
    type = string
    description = "IAM Role que será atachada na instancia"
}

variable "ec2_tags" {
    type = map(any)
    description = "Map de tags para EC2"
}