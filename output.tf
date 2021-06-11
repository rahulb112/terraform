output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "ec2_instance_id" {
  value = aws_instance.my_ec2.id
}

output "ec2_public_ip" {
  value = aws_eip.ec2eip.public_ip
}

output "ec2_ebs_id" {
  value = aws_instance.my_ec2.ebs_block_device.volume_id
}

output "ec2_az" {
  value = aws_instance.my_ec2.availability_zone
}


