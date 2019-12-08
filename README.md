# CloudCreator
A terraform project that scaffolds out some example networks in amazon web services

## version
- 0.10.0

## usage
- create a terraform.tfvars with the values for aws_region, avaiability_zone, aws_access_key, and aws_secret_key
- run terraform init, plan, apply, and destroy in your aws account

## Status
- modules for creation of a management vpc (hub) and other vpc (spoke) created using transit gateway
- all private subnets use nat gateway for outbound internet, all public use internet gateway
- main.tf file defined with example networks
- basic security groups created
- modules added for openvpn access server standup in mgmt network with notes
- circleci configuration example added
