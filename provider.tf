provider "aws" {
  region     = "${var.aws_region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  skip_credentials_validation = true  #aws security token service will squash this for accounts without this implemented
}
