locals {
  public_route53_zone = "public.domain.name"
  public_ingress      = "public_lb_dns"
}

data "aws_route53_zone" "public" {
  name         = local.public_route53_zone
  private_zone = false
}

resource "aws_route53_record" "grafana" {
  zone_id = data.aws_route53_zone.public.zone_id
  name    = "grafana"
  type    = "CNAME"
  ttl     = 300
  records = [local.public_ingress]
}

# Do NOT expose Prometheus to Internet (demo only)
resource "aws_route53_record" "prometheus" {
  zone_id = data.aws_route53_zone.public.zone_id
  name    = "prometheus"
  type    = "CNAME"
  ttl     = 300
  records = [local.public_ingress]
}
