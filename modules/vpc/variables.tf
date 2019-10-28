# vpc variables
variable "vpc_name" {
  description = "the name of the vpc"
}
variable "vpc_cidr" {
  description = "the cidr of the management vpc"
}
variable "vpc_public_cidr" {
  description = "the cidr of the management vpc public subnet"
}
variable "vpc_private_cidr" {
  description = "the cidr of the management vpc private subnet"
}
