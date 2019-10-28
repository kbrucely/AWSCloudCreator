resource "aws_vpc" "management" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "management"
  }
}
