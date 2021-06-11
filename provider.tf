provider "aws" {
  region = "eu-west-2"
}

terraform {
  backend "s3" {
    bucket = "simple-terraform"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
}
