variable "key_name" {
  description = "the ssh key used to manage the instance"
}
variable "mgmt_pub_subnet_id" {
  description = "the id of the public management subnet"
}
variable "mgmt_secgrp" {
  description = "the id of the mgmt network security group"
}
variable "ami" {
  description = "the ID of the ami to create"
}
variable "instance_type" {
  description = "size of the openvpn instance"
}
variable "volume_size" {
  description = "size of the volume of the root device"
}
