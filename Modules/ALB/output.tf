output "alb_dns" {
  description = "DNS da LB criada"
  value = aws_lb.app.dns_name
}