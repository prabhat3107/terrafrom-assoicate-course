resource "aws_internet_gateway" "app001_igw" {
  vpc_id = aws_vpc.app_001.id
  tags = merge(
    { Name = "VPC APP001 IGW" },var.aws_internet_gateway_tags
  )
}