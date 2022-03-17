variable "tg_name" {
    type = string
    description = "Target group name"
}

variable "app_port" {
    type = number
    description = "Target group app port"
}

variable "app_protocol" {
    type = string
    description = "Protocolo utilizado"
}

variable "vpc_id" {
    type = string
    description = "Id da VPC"
}

variable "health_check_path" {
    type = string
    description = "Path de health check"
}

variable "tg_tags" {
    type = map(any)
    description = "Map de tags"
}

variable "instance_id" {
    type = string
    description = "Id da instancia EC2"
}