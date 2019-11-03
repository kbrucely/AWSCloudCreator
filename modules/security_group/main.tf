resource "aws_security_group" "sec_grp" {
  name = "${var.security_group_name}"
  description = "${var.security_group_name} security group"
  vpc_id = "${var.vpc_id}"
}

resource "aws_security_group_rule" "allow_all_local_inbound_tcp" {
  type            = "ingress"
  from_port       = 0
  to_port         = 65535
  protocol        = "tcp"
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  cidr_blocks = [ "${var.network_cidr}" ]

  security_group_id = "${aws_security_group.sec_grp.id}"
}

resource "aws_security_group_rule" "allow_all_local_outbound_tcp" {
  type            = "egress"
  from_port       = 0
  to_port         = 65535
  protocol        = "tcp"
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  cidr_blocks = [ "${var.network_cidr}" ]

  security_group_id = "${aws_security_group.sec_grp.id}"
}

resource "aws_security_group_rule" "allow_all_local_inbound_udp" {
  type            = "ingress"
  from_port       = 0
  to_port         = 65535
  protocol        = "udp"
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  cidr_blocks = [ "${var.network_cidr}" ]

  security_group_id = "${aws_security_group.sec_grp.id}"
}

resource "aws_security_group_rule" "allow_all_local_outbound_udp" {
  type            = "egress"
  from_port       = 0
  to_port         = 65535
  protocol        = "udp"
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  cidr_blocks = [ "${var.network_cidr}" ]

  security_group_id = "${aws_security_group.sec_grp.id}"
}

resource "aws_security_group_rule" "allow_internet_web_inbound" {
  type            = "ingress"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  cidr_blocks = [ "0.0.0.0/0" ]

  security_group_id = "${aws_security_group.sec_grp.id}"
}

resource "aws_security_group_rule" "allow_internet_web_outbound" {
  type            = "egress"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  cidr_blocks = [ "0.0.0.0/0" ]

  security_group_id = "${aws_security_group.sec_grp.id}"
}

resource "aws_security_group_rule" "allow_ssl_web_inbound" {
  type            = "ingress"
  from_port       = 443
  to_port         = 443
  protocol        = "tcp"
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  cidr_blocks = [ "0.0.0.0/0" ]

  security_group_id = "${aws_security_group.sec_grp.id}"
}

resource "aws_security_group_rule" "allow_ssl_web_outbound" {
  type            = "egress"
  from_port       = 443
  to_port         = 443
  protocol        = "tcp"
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  cidr_blocks = [ "0.0.0.0/0" ]

  security_group_id = "${aws_security_group.sec_grp.id}"
}

resource "aws_security_group_rule" "allow_ssh_mgmt_inbound" {
  type            = "ingress"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  cidr_blocks = [ "${var.mgmt_ip_allowed}" ]

  security_group_id = "${aws_security_group.sec_grp.id}"
}

resource "aws_security_group_rule" "allow_rdp_mgmt_inbound" {
  type            = "ingress"
  from_port       = 3389
  to_port         = 3389
  protocol        = "tcp"
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  cidr_blocks = [ "${var.mgmt_ip_allowed}" ]

  security_group_id = "${aws_security_group.sec_grp.id}"
}

# from and to ports for icmp are imcp type number and code
resource "aws_security_group_rule" "allow_inbound_icmp" {
  type            = "ingress"
  from_port       = 8
  to_port         = 0
  protocol        = "icmp"
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  cidr_blocks = [ "0.0.0.0/0" ]

  security_group_id = "${aws_security_group.sec_grp.id}"
}

resource "aws_security_group_rule" "allow_outbound_icmp" {
  type            = "egress"
  from_port       = 8
  to_port         = 0
  protocol        = "icmp"
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  cidr_blocks = [ "0.0.0.0/0" ]

  security_group_id = "${aws_security_group.sec_grp.id}"
}
