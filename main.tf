# all example values that we will remove and substitute variables in at a later date

module "mgmtvpc" {
  source = "./modules/mgmt"

  network_cidr = "10.30.0.0/16"
  management_vpc_cidr = "10.30.0.0/23"
  management_public_cidr = "10.30.0.0/24"
  management_private_cidr = "10.30.1.0/24"
  availability_zone = "${var.availability_zone}"
}

module "mgmtvpc_secgroup" {
  source = "./modules/security_group"

  security_group_name = "mgmt vpc security group"
  vpc_id = "${module.mgmtvpc.mgmt_vpc_id}"
  network_cidr = "10.30.0.0/16"
  mgmt_ip_allowed = "${var.mgmt_ip_allowed}"
}

module "vpc1" {
  source = "./modules/vpc"

  network_cidr = "10.30.0.0/16"
  vpc_name = "vpc1"
  vpc_cidr = "10.30.2.0/23"
  vpc_public_cidr = "10.30.2.0/24"
  vpc_private_cidr = "10.30.3.0/24"
  availability_zone = "${var.availability_zone}"
  transit_gw_id = "${module.mgmtvpc.aws_ec2_transit_gateway_id}"
}

module "vpc1_secgroup" {
  source = "./modules/security_group"

  security_group_name = "vpc1 security group"
  vpc_id = "${module.vpc1.vpc_id}"
  network_cidr = "10.30.0.0/16"
  mgmt_ip_allowed = "${var.mgmt_ip_allowed}"
}

module "vpc2" {
  source = "./modules/vpc"

  network_cidr = "10.30.0.0/16"
  vpc_name = "vpc2"
  vpc_cidr = "10.30.4.0/23"
  vpc_public_cidr = "10.30.4.0/24"
  vpc_private_cidr = "10.30.5.0/24"
  availability_zone = "${var.availability_zone}"
  transit_gw_id = "${module.mgmtvpc.aws_ec2_transit_gateway_id}"
}

module "vpc2_secgroup" {
  source = "./modules/security_group"

  security_group_name = "vpc2 security group"
  vpc_id = "${module.vpc2.vpc_id}"
  network_cidr = "10.30.0.0/16"
  mgmt_ip_allowed = "${var.mgmt_ip_allowed}"
}

module "openvpn" {
  source = "./modules/openvpn"

  key_name = "Oct29"
  ami = "ami-024c80694b5b3e51a"
  instance_type = "t2.micro"
  volume_size = 40
  mgmt_pub_subnet_id = "${module.mgmtvpc.mgmt_pub_subnet_id}"
  mgmt_secgrp = "${module.mgmtvpc_secgroup.sec_grp_id}"
}
