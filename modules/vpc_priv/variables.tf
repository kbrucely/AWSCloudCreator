# vpc variables
variable "vpc_name" {
  description = "the name of the vpc"
}
variable "vpc_cidr" {
  description = "the cidr of the management vpc"
}
variable "vpc_private_cidr" {
  description = "the cidr of the management vpc private subnet"
}
variable "transit_gw_id" {
  description = "id of the transit gateway to attach the vpc to"
}
variable "network_cidr" {
  description = "the cidr of the entire internal network"
}
variable "availability_zone" {
  description = "the availability zone to spin subnets in"
}
