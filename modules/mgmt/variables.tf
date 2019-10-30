# management vpc variables
variable "management_vpc_cidr" {
  description = "the cidr of the management vpc"
}
variable "management_public_cidr" {
  description = "the cidr of the management vpc public subnet"
}
variable "management_private_cidr" {
  description = "the cidr of the management vpc private subnet"
}
variable "network_cidr" {
  description = "the cidr of the entire internal network"
}
variable "availability_zone" {
  description = "the availability zone to spin subnets in"
}
