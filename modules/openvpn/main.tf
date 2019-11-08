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


resource "null_resource" "openvpn_install" {

provisioner "file" {
  source      = "./scripts/install.sh"
  destination = "/tmp/install.sh"

  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = "file("${var.key_name}")"
    host = "${aws_instance.openvpn.public_ip}"
  }
}

  provisioner "remote-exec" {
    inline = [
      "sudo chmod u+x /tmp/install.sh",
      "sudo /tmp/install.sh"
    ]

    connection {
      type = "ssh"
      user = "ec2-user"
      private_key = "file("${var.key_name}")"
      host = "${aws_instance.openvpn.public_ip}"
    }
  }

}
