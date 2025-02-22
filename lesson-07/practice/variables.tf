variable "ec2_instance_name" {
  description = "EC2 Instance name"
  type        = string
  default = "ec2i-Lession07"
}
variable "AWS_ACCESS_KEY" {
  description = "aws access key"
  type        = string
  sensitive = true
}
variable "AWS_SECRET_ACCESS_KEY" {
  description = "aws secret key"
  type        = string
  sensitive = true
}