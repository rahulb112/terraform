locals {
  environment = terraform.workspace
}

resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name        = "MainVPC"
    Environment = local.environment
  }
}

resource "aws_subnet" "pub_subnet" {
  count             = "${length(var.pub_subnet_cidr)}"
  vpc_id            = aws_vpc.my_vpc.id
  availability_zone = var.subnet_az[count.index]
  cidr_block        = var.pub_subnet_cidr[count.index]
  tags = {
    Name        = "PubSN-${count.index + 1}"
    Environment = local.environment
  }
}

resource "aws_subnet" "prv_subnet" {
  count             = "${length(var.prv_subnet_cidr)}"
  vpc_id            = aws_vpc.my_vpc.id
  availability_zone = var.subnet_az[count.index]
  cidr_block        = var.prv_subnet_cidr[count.index]
  tags = {
    Name        = "PrvSN-${count.index + 1}"
    Environment = local.environment
  }
}

resource "aws_route_table" "pub-rt" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-igw.id
  }
  tags = {
    Name        = "PublicRT"
    Environment = local.environment
  }
}

resource "aws_route_table" "prv-rt" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name        = "PrivateRT"
    Environment = local.environment
  }
}

resource "aws_route_table_association" "pub-rta" {
  count          = length(var.pub_subnet_cidr)
  subnet_id      = element(aws_subnet.pub_subnet.*.id, count.index)
  route_table_id = aws_route_table.pub-rt.id
}

resource "aws_route_table_association" "prv-rta" {
  count          = length(var.prv_subnet_cidr)
  subnet_id      = element(aws_subnet.prv_subnet.*.id, count.index)
  route_table_id = aws_route_table.prv-rt.id
}

resource "aws_eip" "ec2eip" {
  vpc      = true
  instance = aws_instance.my_ec2.id
}

resource "aws_internet_gateway" "dev-igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name        = "IGW"
    Environment = local.environment
  }
}

