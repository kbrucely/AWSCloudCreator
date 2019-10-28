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
