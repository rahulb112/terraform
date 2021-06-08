resource "aws_vpc" "my_vpc" {
cidr_block = "${var.vpc_cidr}"
tags = {
Name = "Primary"
Environment = "dev"
}
}

resource "aws_subnet" "my_subnet1" {
vpc_id = "${aws_vpc.my_vpc.id}"
availability_zone = "eu-west-2a"
cidr_block = "${var.subnet_cidr}"
tags = {
Name = "SN1"
}
}


resource "aws_security_group" "my_sg1" {
vpc_id = "${aws_vpc.my_vpc.id}"
egress {
	from_port = 0
	to_port = 0
	protocol = "tcp"
	cidr_blocks = ["10.1.1.0/24"]
	}
	
	dynamic "ingress" {
	for_each = var.sg_ports
	content {
	from_port = ingress.value
	to_port = ingress.value
	protocol = "tcp"
	cidr_blocks = ["10.1.1.0/24"]
	}
	}
}
	
