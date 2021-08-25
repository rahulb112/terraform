provider "aws" {
  region = "eu-west-2"
}

terraform {
  backend "s3" {
    bucket = "test-sagemaker-bucket5"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
}
