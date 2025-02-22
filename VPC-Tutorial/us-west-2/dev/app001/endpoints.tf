resource "aws_vpc_endpoint" "us_west_2_app001_vpc_endpoint_gw" {

  vpc_id = module.vpc.vpc_id
  vpc_endpoint_type = "Gateway"
  service_name = "com.amazonaws.us-west-2.s3"
  route_table_ids = flatten([module.vpc.private_route_table_ids])

  tags = merge(
    data.terraform_remote_state.global_app001_remote.outputs.default_tags,
    var.default_tags,
    {
    Name = "ap-west-2-dev-app001-vpc-endpoint-gw"
    },
  )
}
