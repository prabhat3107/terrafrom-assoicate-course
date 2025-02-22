
variable "default_tags" {
  default = {
    TFRepoDirectory = "global/dev/app001/ec2"
  }
  type = map(string)
}

variable "key_name" {
  default = "my_aws_key"
  type    = string
}

variable "instance_type" {
  default = "t2.micro"
  type    = string
}

variable "policies_to_attach" {
  default = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  ]
  type = list(string)
}
