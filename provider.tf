provider "aws" {
  region = "eu-west-2"
}

terraform {
  backend "s3" {
    bucket = "test-sagemaker-bucket3"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
}
