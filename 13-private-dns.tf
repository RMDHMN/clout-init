locals {
  private_route53_zone = "private.domain.name"
  private_ingress      = "private_lb_dns"
}

resource "aws_route53_zone" "private" {
  name = local.private_route53_zone

  vpc {
    vpc_id = aws_vpc.main.id
  }
}

resource "aws_route53_record" "rest" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "rest"
  type    = "CNAME"
  ttl     = 300
  records = [local.private_ingress]
}

resource "aws_route53_record" "grpc" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "grpc"
  type    = "CNAME"
  ttl     = 300
  records = [local.private_ingress]
}
