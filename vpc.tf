resource "aws_vpc" "my_vpc" {
cidr_block = "${var.vpc_cidr}"
tags = {
Name = "MainVPC"
Environment = "DEV"
	}
}

resource "aws_subnet" "pub_subnet" {
count = "$length(var.pub_subnet_cidr)}"
vpc_id = "${aws_vpc.my_vpc.id}"
availability_zone = "${var.subnet_az[count.index]}"
cidr_block = "${var.pub_subnet_cidr[count.index]}"
tags = {
Name = "PubSN-${count.index+1}"
	}
}

resource "aws_subnet" "prv_subnet" {
count = "$length(var.prv_subnet_cidr)}"
vpc_id = "${aws_vpc.my_vpc.id}"
availability_zone = "${var.subnet_az[count.index]}"
cidr_block = "${var.pub_subnet_cidr[count.index]}"
tags = {
Name = "PrvSN-${count.index+1}"
	}
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

resource "aws_route_table_association" "public-subnet"{
    subnet_id = "${aws_subnet.prod-subnet-public-1.id}"
    route_table_id = "${aws_route_table.prod-public-crt.id}"
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
	
