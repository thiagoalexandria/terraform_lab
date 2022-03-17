output "instance_id" {
  description = "ID da instancia EC2"
  value       = aws_instance.instance.id
}