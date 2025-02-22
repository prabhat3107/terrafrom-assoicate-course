variable "vpc_id" {
  description = "VPC into which ec2 instance should be deployed"
  type = string

}

variable "cidr_block" {
  description = "VPC CIDR block: 10.0.0.0/16"
  type = string
}

variable "ami" {
  description = "ID of AMI to use for the instance"
  type = string
}

variable "instance_type" {
  description = "Type of instance to start"
  type = string
}

variable "webserver_name" {
  description = "Name for webserver ec2 instance"
  type = string
}