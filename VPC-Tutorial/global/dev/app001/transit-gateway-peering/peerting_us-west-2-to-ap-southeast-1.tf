module "us_west_2_to_ap_southeast_1" {
  source  = "../../../../modules/tgw-peering"

  providers = {
    aws = aws.us-west-2
  }

  name                            = "us-west-2-to-ap-southeast-1"
  source_region                   = "us-west-2"
  destination_region              = "ap-southeast-1"
  source_tgw_id                   = module.us_west_2_tgw.ec2_transit_gateway_id
  destination_tgw_id              = module.ap_southeast_1_tgw.ec2_transit_gateway_id
  source_cidr                     = data.terraform_remote_state.us_west_2_app001_remote.outputs.vpc_cidr
  destination_cidr                = data.terraform_remote_state.ap_southeast_1_app001_remote.outputs.vpc_cidr
  source_route_table_id           = module.us_west_2_tgw.ec2_transit_gateway_association_default_route_table_id
  destination_route_table_id      = module.ap_southeast_1_tgw.ec2_transit_gateway_association_default_route_table_id
  source_vpc_route_table_ids      = data.terraform_remote_state.us_west_2_app001_remote.outputs.vpc_private_route_table_ids
  destination_vpc_route_table_ids = data.terraform_remote_state.ap_southeast_1_app001_remote.outputs.vpc_private_route_table_ids
  tags_to_apply                   = data.terraform_remote_state.global_app001_remote.outputs.default_tags

}