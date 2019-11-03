variable "security_group_name" {
  description = "the name of the security group"
}
variable "vpc_id" {
  description = "the IP address of the VPC to create the group in"
}
variable "network_cidr" {
  description = "the network cidr of your private AWS subnets"
}
variable "mgmt_ip_allowed" {
  description = "the ip addresses of networks allowed SSH and RDP access"
}
