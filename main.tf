module "mgmtvpc" {
  source = "./modules/mgmt"

  management_vpc_cidr = "10.30.0.0/23"
  management_public_cidr = "10.30.0.0/24"
  management_private_cidr = "10.30.1.0/24"
}

module "vpc1" {
  source = "./modules/vpc"

  vpc_name = "vpc1"
  vpc_cidr = "10.30.2.0/23"
  vpc_public_cidr = "10.30.2.0/24"
  vpc_private_cidr = "10.30.3.0/24"
}

module "vpc2" {
  source = "./modules/vpc"

  vpc_name = "vpc2"
  vpc_cidr = "10.30.4.0/23"
  vpc_public_cidr = "10.30.4.0/24"
  vpc_private_cidr = "10.30.5.0/24"
}