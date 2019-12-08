terraform {
  backend "s3" {
    bucket = "terraform-state-kl"
    key    = "vpc/terraform.tfstate"
    region = "us-west-1"
  }
}
