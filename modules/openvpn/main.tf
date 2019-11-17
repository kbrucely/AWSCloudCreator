# you should feed in an openvpn access server, byol ami id
resource "aws_instance" "openvpn" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  subnet_id = "${var.mgmt_pub_subnet_id}"
  vpc_security_group_ids = [ "${var.mgmt_secgrp}" ]

  tags = {
    name = "openvpn"
  }

  root_block_device {
    volume_size = "${var.volume_size}"
  }
}
