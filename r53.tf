resource "aws_route53_record" "app" {
  zone_id = data.aws_route53_zone.thiago.zone_id
  name    = "app.thiago.click"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_lb.app.dns_name]
}