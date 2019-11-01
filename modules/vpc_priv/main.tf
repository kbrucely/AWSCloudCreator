resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc_cidr}"

  tags = {
    Name = "${var.vpc_name}"
  }
}

resource "aws_subnet" "vpc_private" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.vpc_private_cidr}"
  availability_zone = "${var.availability_zone}"

  tags = {
    Name = "${var.vpc_name}_private"
  }
}

resource "aws_internet_gateway" "vpc_gw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags = {
    Name = "${var.vpc_name}_gw"
  }
}

resource "aws_route_table" "vpc_route_table" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags = {
    Name = "${var.vpc_name}_route_table"
  }
}

resource "aws_route" "vpc_default" {
  route_table_id = "${aws_route_table.vpc_route_table.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.vpc_gw.id}"
}

resource "aws_route" "vpc_internal" {
  route_table_id = "${aws_route_table.vpc_route_table.id}"
  destination_cidr_block = "${var.network_cidr}"
  gateway_id = "${var.transit_gw_id}"
}

resource "aws_route_table_association" "vpc_assoc_priv" {
  subnet_id = "${aws_subnet.vpc_private.id}"
  route_table_id = "${aws_route_table.vpc_route_table.id}"
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_attachment" {
  subnet_ids = ["${aws_subnet.vpc_private.id}"]
  transit_gateway_id = "${var.transit_gw_id}"
  vpc_id = "${aws_vpc.vpc.id}"
}
