variable "vpc_id" {
  description = "VPC ID"
  type = string
}

variable "cidr_block" {
  description = "VPC CIDR block"
  type = string
}

variable "ami" {
  type = string
  description = "AMI id to launch"
}
variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "Instance type"
}

variable "webserver_name" {
  type = string
  description = "Name of the Webserver instance"
}