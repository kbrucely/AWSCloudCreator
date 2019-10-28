resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc_cidr}"

  tags = {
    Name = "${var.vpc_name}"
  }
}

resource "aws_subnet" "vpc_public" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.vpc_public_cidr}"
  map_public_ip_on_launch = true                # set this because public subnet

  tags = {
    Name = "${var.vpc_name}_public"
  }
}

resource "aws_subnet" "vpc_private" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.vpc_private_cidr}"

  tags = {
    Name = "${var.vpc_name}_private"
  }
}
