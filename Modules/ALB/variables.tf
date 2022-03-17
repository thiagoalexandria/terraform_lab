variable "alb_name" {
    type = string
    description = "Nome da ALB"
}

variable "alb_internal" {
    type = bool
    description = "Definição se a ALB será interna ou publica"
}

variable "alb_type" {
    type = string
    description = "Tipo de ALB"
}

variable "alb_security_groups" {
    type = list(any)
    description = "Lista de security groups"
}

variable "subnets" {
    type = list(any)
    description = "Lista de subnets"
}

variable "alb_tags" {
    type = map(any)
    description = "Mapa de tags para ALB"
}

variable "alb_deletion_protection" {
    type = bool
    description = "Proteção de delet"
    default = false
}

variable "target_group_arn" {
    type = string
}