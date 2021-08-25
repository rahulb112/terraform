resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "pub_subnet" {
  count             = length(var.pub_subnet_cidr)
  vpc_id            = "aws_vpc.my_vpc.id"
  availability_zone = "var.subnet_az[count.index]"
  cidr_block        = var.pub_subnet_cidr[count.index]
}
