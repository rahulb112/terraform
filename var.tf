variable "vpc_cidr" {
default = "10.1.0.0/16"
}

variable "subnet_cidr" {
default = "10.1.1.0/24"
}

variable "ami" {
default = "ami-xxxxxxxx"
}

variable "sg_ports" {
type = list
default = [22,23,8080]
}
