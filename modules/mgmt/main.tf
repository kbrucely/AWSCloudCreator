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
  availability_zone = "${var.availability_zone}"

  tags = {
    Name = "mgmt_public"
  }
}

resource "aws_subnet" "mgmt_private" {
  vpc_id = "${aws_vpc.management.id}"
  cidr_block = "${var.management_private_cidr}"
  availability_zone = "${var.availability_zone}"

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

resource "aws_eip" "nat" {

}

resource "aws_nat_gateway" "mgmt_nat_gw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.mgmt_public.id}"

  tags = {
    Name = "mgmt_nat_gw"
  }
}

resource "aws_route_table" "mgmt_route_table_priv" {
  vpc_id = "${aws_vpc.management.id}"

  tags = {
    Name = "mgmt_route_table_priv"
  }
}

resource "aws_route_table" "mgmt_route_table_pub" {
  vpc_id = "${aws_vpc.management.id}"

  tags = {
    Name = "mgmt_route_table_pub"
  }
}


resource "aws_route" "mgmt_default_priv" {
  route_table_id = "${aws_route_table.mgmt_route_table_priv.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_nat_gateway.mgmt_nat_gw.id}"
}

resource "aws_route" "internal_traffic_priv" {
  route_table_id = "${aws_route_table.mgmt_route_table_priv.id}"
  destination_cidr_block = "${var.network_cidr}"
  gateway_id = "${aws_ec2_transit_gateway.mgmt_transit_gw.id}"
}

resource "aws_route_table_association" "mgmt_assoc_priv" {
  subnet_id = "${aws_subnet.mgmt_private.id}"
  route_table_id = "${aws_route_table.mgmt_route_table_priv.id}"
}

resource "aws_route" "mgmt_default_pub" {
  route_table_id = "${aws_route_table.mgmt_route_table_pub.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.mgmt_gw.id}"
}

resource "aws_route" "internal_traffic_pub" {
  route_table_id = "${aws_route_table.mgmt_route_table_pub.id}"
  destination_cidr_block = "${var.network_cidr}"
  gateway_id = "${aws_ec2_transit_gateway.mgmt_transit_gw.id}"
}

resource "aws_route_table_association" "mgmt_assoc_pub" {
  subnet_id = "${aws_subnet.mgmt_public.id}"
  route_table_id = "${aws_route_table.mgmt_route_table_pub.id}"
}



resource "aws_ec2_transit_gateway" "mgmt_transit_gw" {
  description = "the transit gateway for our account"
}

resource "aws_ec2_transit_gateway_vpc_attachment" "mgmt_vpc_attachment" {
  subnet_ids = ["${aws_subnet.mgmt_private.id}"]
  transit_gateway_id = "${aws_ec2_transit_gateway.mgmt_transit_gw.id}"
  vpc_id = "${aws_vpc.management.id}"
}

output "mgmt_vpc_id" {
  value = "${aws_vpc.management.id}"
}

output "aws_ec2_transit_gateway_id" {
  value = "${aws_ec2_transit_gateway.mgmt_transit_gw.id}"
}
