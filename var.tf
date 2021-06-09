variable "vpc_cidr" {
default = "10.1.0.0/24"
}

variable "pub1_subnet_cidr" {
default = "10.1.0.0/26"
}

variable "pub2_subnet_cidr" {
default = "10.1.0.64/26"
}

variable "prv1_subnet_cidr" {
default = "10.1.0.128/26"
}

variable "prv2_subnet_cidr" {
default = "10.1.0.192/26"
}

variable "ami" {
default = "ami-xxxxxxxx"
}

variable "sg_ports" {
type = list
default = [22,80]
}
