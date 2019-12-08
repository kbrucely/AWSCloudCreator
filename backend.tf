terraform {
  backend "s3" {
    key    = "vpc/terraform.tfstate"
    region = "us-west-1"
  }
}
