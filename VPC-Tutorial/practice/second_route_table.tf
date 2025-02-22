##This is the route table associated with public subnet of the vpc
resource "aws_route_table" "second_rt" {
  vpc_id = aws_vpc.app_001.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.app001_igw.id
  }
  tags = merge(
    { Name = "Second Route Table" },var.second_rt_tags
  )

}

resource "aws_route_table_association" "public_subnet_a" {
  count = length(var.vpc_public_subnets)
  subnet_id = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.second_rt.id
}