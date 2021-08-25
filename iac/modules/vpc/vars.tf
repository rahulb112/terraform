variable "vpc_cidr" {}

variable "pub_subnet_cidr" {
  type = list(any)
}

variable "availability_zone" {
  type = list(any)
}
