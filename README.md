# CloudCreator
A terraform project that scaffolds out some example networks in amazon web services

## usage
- create a terraform.tfvars with the values for aws_region, aws_access_key, and aws_secret_key
- run terraform plan, apply, and destroy in your aws account

## Status
- modules for creation of a management vpc (hub) and other vpc (spoke) created
- main.tf file defined with example networks
- next up: create vpn instance/main router in mgmt vpc for connectivity to ancillary vpcs
- next up: create vpn/router instances which will be used to connect the vpcs
