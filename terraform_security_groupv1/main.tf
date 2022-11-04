resource "aws_security_group" "web" {
  name        = "${var.env}-web-sg"
  description = "This is a security group for Web Instance"
}

resource "aws_security_group_rule" "web_ingress" {
  for_each          = var.ingress_rules
  type              = "ingress"
  from_port         = each.key
  to_port           = each.key
  protocol          = "tcp"
  cidr_blocks       = [each.value]
  security_group_id = aws_security_group.web.id
}
resource "aws_security_group_rule" "web_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web.id
}