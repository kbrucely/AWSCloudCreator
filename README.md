# CloudCreator
A terraform project that scaffolds out some example networks in amazon web services

## version
- 0.6.0

## usage
- create a terraform.tfvars with the values for aws_region, avaiability_zone, aws_access_key, and aws_secret_key
- run terraform plan, apply, and destroy in your aws account

## Status
- modules for creation of a management vpc (hub) and other vpc (spoke) created using transit gateway
- main.tf file defined with example networks
- next up: add modules for sane security groups
