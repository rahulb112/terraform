resource "aws_instance" "my_ec2" {
ami = "${var.ami}"
instance_type = "t2.micro"
subnet_id = "${aws_subnet.my_subnet1.id}"
user_data = "${file("path/apache.sh")}"
vpc_security_group_ids = ["${aws_security_group.my_sg1.id}"]
tags = {
        Name = "my-ec2"
}
}

