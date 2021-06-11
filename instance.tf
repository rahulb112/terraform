resource "aws_instance" "my_ec2" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.pub_subnet.1.id
  user_data              = file("apache.sh")
  key_name               = aws_key_pair.ec2-key.key_name
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
  vpc_security_group_ids = ["${aws_security_group.web_sg1.id}"]
  ebs_block_device = [
    {
      device_name = "/dev/sdf"
      volume_type = "gp2"
      volume_size = 8
    }
  ]
  tags = {
    Name = "my-ec2"
  }
}

resource "aws_key_pair" "ec2-key" {
  key_name   = "key.pub"
  public_key = "ssh-rsa XXXXXXX email@example.com"
}

resource "aws_security_group" "web_sg1" {
  vpc_id = aws_vpc.my_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  dynamic "ingress" {
    for_each = var.sg_ports
    content {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.1.0.0/24"]
  }
  }
}

