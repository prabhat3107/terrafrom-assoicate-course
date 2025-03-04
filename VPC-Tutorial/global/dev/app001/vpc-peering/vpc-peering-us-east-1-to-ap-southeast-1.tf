resource "aws_vpc_peering_connection" "us_east_1_to_ap_southeast_1" {

  provider    = aws.us-east-1
  peer_vpc_id = data.terraform_remote_state.ap_southeast_1_app001_remote.outputs.vpc_id
  vpc_id      = data.terraform_remote_state.us_east_1_app001_remote.outputs.vpc_id
  auto_accept = false
  peer_region = "ap-southeast-1"

#  requester {
#    allow_remote_vpc_dns_resolution = true
#  }
  tags = merge(
    data.terraform_remote_state.global_app001_remote.outputs.default_tags,
    var.default_tags,
    {
    Name = "prod-main-us-east-1-to-ap-southeast-1"
    },
  )

}

resource "aws_vpc_peering_connection_accepter" "us_east_1_to_ap_southeast_1_accepter" {
  provider                  = aws.ap-southeast-1
  vpc_peering_connection_id = aws_vpc_peering_connection.us_east_1_to_ap_southeast_1.id
  auto_accept               = true
  accepter {
    allow_remote_vpc_dns_resolution = true
  }
  tags = merge(
    var.default_tags,
    data.terraform_remote_state.global_app001_remote.outputs.default_tags,
    {
    Name = "prod-main-us-east-1-to-ap-southeast-1-accepter"
    },
  )
}

module "us_east_1_to_ap_southeast_1_routes" {
  source  = "../../../../modules/vpc-peering-routes"

  providers = {
    aws = aws.us-east-1
  }

  source_region                   = "us-east-1"
  destination_region              = "ap-southeast-1"
  vpc_peering_connection_id       = aws_vpc_peering_connection.us_east_1_to_ap_southeast_1.id
  source_cidr                     = data.terraform_remote_state.us_east_1_app001_remote.outputs.vpc_cidr
  destination_cidr                = data.terraform_remote_state.ap_southeast_1_app001_remote.outputs.vpc_cidr
  source_vpc_route_table_ids      = data.terraform_remote_state.us_east_1_app001_remote.outputs.vpc_private_route_table_ids
  destination_vpc_route_table_ids = data.terraform_remote_state.ap_southeast_1_app001_remote.outputs.vpc_private_route_table_ids

}

