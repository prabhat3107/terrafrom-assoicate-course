resource "aws_subnet" "public_subnets" {
  count = length(var.vpc_public_subnets)
  vpc_id = aws_vpc.app_001.id
  cidr_block = var.vpc_public_subnets[count.index]
  availability_zone = var.vpc_azs[count.index]
  tags = merge(
    { Name = "Public subnet ${count.index + 1 }" },var.vpc_public_subnet_tags
  )


}
resource "aws_subnet" "private_subnets" {
  count = length(var.vpc_private_subnets)
  vpc_id = aws_vpc.app_001.id
  cidr_block = var.vpc_private_subnets[count.index]
  availability_zone = var.vpc_azs[count.index]
  tags = merge(
    { Name = "Private subnet ${count.index + 1 }" },var.vpc_private_subnet_tags
  )

}