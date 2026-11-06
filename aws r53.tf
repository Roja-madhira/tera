resource "aws_route53_record" "roboshop" {
  allow_overwrite = true
  count = 10
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.roboshop[count.index].private_ip]
}
resource "aws_route53_record" "frontend" {
  allow_overwrite = true
  count = contains(var.instances,"frontend") ? 1 : 0
  zone_id = var.zone_id
  name    = "${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.roboshop[index(var.instances,"frontend")].public_ip]
}
