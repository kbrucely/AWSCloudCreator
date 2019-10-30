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

resource "aws_internet_gateway" "mgmt_gw" {
  vpc_id = "${aws_vpc.management.id}"

  tags = {
    Name = "mgmt_gw"
  }
}

resource "aws_route_table" "mgmt_route_table" {
  vpc_id = "${aws_vpc.management.id}"

  tags = {
    Name = "mgmt_route_table"
  }
}

resource "aws_route" "mgmt_default" {
  route_table_id = "${aws_route_table.mgmt_route_table.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.mgmt_gw.id}"
}

resource "aws_route_table_association" "mgmt_assoc_pub" {
  subnet_id = "${aws_subnet.mgmt_public.id}"
  route_table_id = "${aws_route_table.mgmt_route_table.id}"
}

resource "aws_route_table_association" "mgmt_assoc_priv" {
  subnet_id = "${aws_subnet.mgmt_private.id}"
  route_table_id = "${aws_route_table.mgmt_route_table.id}"
}

resource "aws_ec2_transit_gateway" "mgmt_transit_gw" {
  description = "the transit gateway for our account"
}

resource "aws_ec2_transit_gateway_vpc_attachment" "mgmt_vpc_attachment" {
  subnet_ids = ["${aws_subnet.mgmt_private.id}"]
  transit_gateway_id = "${aws_ec2_transit_gateway.mgmt_transit_gw.id}"
  vpc_id = "${aws_vpc.management.id}"
}

output "aws_ec2_transit_gateway_id" {
  value = "${aws_ec2_transit_gateway.mgmt_transit_gw.id}"
}
