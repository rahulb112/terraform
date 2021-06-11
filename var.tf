variable "vpc_cidr" {
  default = "10.1.0.0/24"
}

variable "pub_subnet_cidr" {
  type    = list
  default = ["10.1.0.0/26", "10.1.0.64/26"]
}

variable "prv_subnet_cidr" {
  type    = list
  default = ["10.1.0.128/26", "10.1.0.192/26"]
}

variable "subnet_az" {
  type    = list
  default = ["eu-west-2a", "eu-west-2b"]
}

variable "sg_ports" {
  type    = list(number)
  default = ["22", "80"]
}

variable "ami" {
  default = "ami-xxxxxxxx"
}

