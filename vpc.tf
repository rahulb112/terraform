resources "aws_vpc" "my_vpc" {
cidr_block = "${var.vpc_cidr}"
tags = {
Name = "Primary"
Environment = "dev"
	}
}

resources "aws_subnet" "my_subnet1" {
vpc_id = "${aws_vpc.my_vpc.id}"
availbilty_zone = "eu-west-2a"
cidr_block = "${var.subnet_cidr}"
tags = {
Name = "SN1"
	}
}

resources "aws_ec2" "my_ec2" {
ami = "${var.ami}"
instance_type = "t2.micro"
subnet_id = "${aws_subnet.my_subnet1.id}"
user_data = "${file("path/file_name")}"
vpc_security_group_ids = ["${aws_security_group.my_sg1.id}"]
tags = {
	Name = "my-ec2"
	}
}

resources "aws_security_group" "my_sg1" {
vpc_id = "${aws_vpc.my_vpc.id}"
	egress = {
	from_port = 0
	to_port = 0
	protocol = "tcp"
	cidr_blocks = ["10.1.1.0/24"]
	}
	
	dynamic "ingress" {
	for_each = var.sg_ports
	contents {
	from_port = ingress.value
	to_port = ingress.value
	protocol = "tcp"
	cidr_blocks = ["10.1.1.0/24"]
	}
	}
}
	
