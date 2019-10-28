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
