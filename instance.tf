resource "aws_instance" "my_ec2" {
ami = "${var.ami}"
instance_type = "t2.micro"
subnet_id = "${aws_subnet.my_subnet1.id}"
user_data = "${file("path/apache.sh")}"
key_name = "{aws_key_pair.ec2-key.key_name}"
vpc_security_group_ids = ["${aws_security_group.my_sg1.id}"]
tags = {
        Name = "my-ec2"
}
}

resource "aws_key_pair" "ec2-key" {
  key_name   = "key.pub"
  public_key = "ssh-rsa XXXXXXX email@example.com"
}
