#date 2/13/25
# time 9:57 PM
resource "aws_instance" "host1" {
  count = length(var.vpc_public_subnets)
  ami = "ami-0cb91c7de36eed2cb" #ubuntu 24.4 LTS
  instance_type = "t2.micro"
  availability_zone = var.vpc_azs[count.index]
  subnet_id = aws_subnet.public_subnets[count.index]
  key_name = "my_aws_key"
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
}
resource "aws_security_group" "ec2_sg" {
  name = "ec2_sg"
  description = "Allow SSH inbound traffic"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}