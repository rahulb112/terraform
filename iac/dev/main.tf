module "my_vpc" {
  source            = "../modules/vpc"
  vpc_cidr          = "10.1.0.0/16"
  pub_subnet_cidr   = ["10.1.0.0/17", "10.1.128.0/17"]
  availability_zone = ["eu-west-2a", "eu-west-2c"]
}

module "my_ec2" {
  source        = "../modules/ec2"
  instance_type = "t2.micro"
  ami           = "ami-xxxx"
}
