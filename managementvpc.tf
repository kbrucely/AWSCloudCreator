resource "aws_vpc" "management" {
  cidr_block = "${var.management_vpc_cidr}"

  tags = {
    Name = "management"
  }
}
