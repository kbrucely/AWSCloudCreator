# all example values that we will remove and substitute variables in at a later date

module "mgmtvpc" {
  source = "./modules/mgmt"


  network_cidr = "10.30.0.0/16"
  management_vpc_cidr = "10.30.0.0/23"
  management_public_cidr = "10.30.0.0/24"
  management_private_cidr = "10.30.1.0/24"
  availability_zone = "${var.availability_zone}"

}

module "vpc1" {
  source = "./modules/vpc_pub"

  network_cidr = "10.30.0.0/16"
  vpc_name = "vpc1"
  vpc_cidr = "10.30.2.0/23"
  vpc_public_cidr = "10.30.2.0/24"
  vpc_private_cidr = "10.30.3.0/24"
  availability_zone = "${var.availability_zone}"
  transit_gw_id = "${module.mgmtvpc.aws_ec2_transit_gateway_id}"
}

module "vpc2" {
  source = "./modules/vpc_priv"

  network_cidr = "10.30.0.0/16"
  vpc_name = "vpc2"
  vpc_cidr = "10.30.4.0/23"
  vpc_private_cidr = "10.30.4.0/24"
  availability_zone = "${var.availability_zone}"
  transit_gw_id = "${module.mgmtvpc.aws_ec2_transit_gateway_id}"
}
