output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "vpc_cidr_block" {
  value = aws_vpc.my_vpc.cidr_block
}

output "ec2_instance_id" {
  value = aws_instance.my_ec2.id
}

output "ec2_public_ip" {
  value = aws_eip.ec2eip.public_ip
}

output "ec2_ebs_id" {
  value = aws_instance.my_ec2.ebs_block_device.volume_id[]
}

output "ec2_az" {
  value = aws_instance.my_ec2.availability_zone
}

output "public_subnets_id" {
  value = aws_subnet.pub_subnet.*.id
}

output "private_subnets_id" {
  value = aws_subnet.prv_subnet.*.id
}

output "public_subnets_cidr" {
  value = aws_subnet.pub_subnet.*.cidr_block
}

output "private_subnets_cidr" {
  value = aws_subnet.prv_subnet.*.cidr_block
}

output "public_route_table_ids" {
  value = aws_route_table.pub-rt.id
}

output "private_route_table_ids" {
  value = aws_route_table.prv-rt.id
}

output "public_route_table_association_ids" {
  value = aws_route_table_association.pub-rta.*.id
}

output "private_route_table_association_ids" {
  value = aws_route_table_association.prv-rta.*.id
}

output "igw_id" {
  value = aws_internet_gateway.dev-igw.id
}

