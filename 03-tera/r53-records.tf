resource "aws_route53_record" "roboshop" {
  allow_overwrite = true
  for_each = aws_instance.roboshop
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [each.value.private_ip]
}

resource "aws_route53_record" "frontend" {
  allow_overwrite = true
  count = contains(keys(var.instances), "frontend") ? 1 : 0
  zone_id = var.zone_id
  name    = "${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [lookup(aws_instance.roboshop,"frontend").public_ip]
}