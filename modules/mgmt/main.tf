resource "aws_vpc" "management" {
  cidr_block = "${var.management_vpc_cidr}"

  tags = {
    Name = "management"
  }
}

resource "aws_subnet" "mgmt_public" {
  vpc_id = "${aws_vpc.management.id}"
  cidr_block = "${var.management_public_cidr}"
  map_public_ip_on_launch = true                # set this because public subnet

  tags = {
    Name = "mgmt_public"
  }
}

resource "aws_subnet" "mgmt_private" {
  vpc_id = "${aws_vpc.management.id}"
  cidr_block = "${var.management_private_cidr}"

  tags = {
    Name = "mgmt_private"
  }
}
