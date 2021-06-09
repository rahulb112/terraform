resource "aws_vpc" "my_vpc" {
cidr_block = "${var.vpc_cidr}"
tags = {
Name = "MainVPC"
Environment = "DEV"
	}
}

resource "aws_subnet" "pub_subnet1" {
vpc_id = "${aws_vpc.my_vpc.id}"
availability_zone = "eu-west-2a"
cidr_block = "${var.pub1_cidr}"
tags = {
Name = "PubSN1"
	}
}

resource "aws_subnet" "pub_subnet2" {
vpc_id = "${aws_vpc.my_vpc.id}"
availability_zone = "eu-west-2b"
cidr_block = "${var.pub2_cidr}"
tags = {
Name = "PubSN2"
	}
}

resource "aws_subnet" "prv_subnet1" {
vpc_id = "${aws_vpc.my_vpc.id}"
availability_zone = "eu-west-2a"
cidr_block = "${var.prv1_cidr}"
tags = {
Name = "PrvSN1"
	}
}

resource "aws_subnet" "prv_subnet2" {
vpc_id = "${aws_vpc.my_vpc.id}"
availability_zone = "eu-west-2b"
cidr_block = "${var.prv2_cidr}"
tags = {
Name = "PrvSN2"
	}
}

resource "aws_route_table" "public-rt" {
vpc_id = "${aws_vpc.my_vpc.id}"
route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.dev-igw.id}"
    }
tags = {
Name = "PublicRT"
	}
}

resource "aws_security_group" "web_sg1" {
vpc_id = "${aws_vpc.my_vpc.id}"
	
egress {
	from_port = 0
	to_port = 0
	protocol = "-1"
	cidr_blocks = ["0.0.0.0/0"]
	}
	
ingress {
	from_port = 22
	to_port = 22
	protocol = "tcp"
	cidr_blocks = ["10.1.0.0/24"]
	}
	
ingress {
	from_port = 80
	to_port = 80
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	}	
}

resource "aws_internet_gateway" "dev-igw" {
    vpc_id = "${aws_vpc.my_vpc.id}"
    tags {
        Name = "IGW"
    	}
}
	
