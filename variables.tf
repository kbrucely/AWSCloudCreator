# provider variables
variable "aws_region" {
  description = "the aws region to run in"
}

variable "aws_access_key" {
  description = "the access key of our aws user"
}

variable "aws_secret_key" {
  description = "the secret key of our aws user"
}
variable "availability_zone" {
  description = "the availability zone to spin subnets in"
}
variable "mgmt_ip_allowed" {
  description = "the IP addresses you will be managing hosts from over ssh or rdp"
}
