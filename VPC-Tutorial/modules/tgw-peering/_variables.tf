variable "name" {
  type = string
  default = "us_east_1_to_us_west_2"
}

variable "source_region" {
  type = string
  default = "us-east-1"
}

variable "destination_region" {
  type = string
  default = "us-west-2"
}

variable "source_tgw_id" {
  type = string
  default = "default"
}

variable "destination_tgw_id" {
  type = string
  default = "default"
}

variable "source_cidr" {
  type = string
  default = "10.255.0.0/16"
}

variable "destination_cidr" {
  type = string
  default = "10.255.0.0/16"
}

variable "source_route_table_id" {
  type = string
  default = "rt-abcdefg"
}

variable "destination_route_table_id" {
  type = string
  default = "rt-abcdefg"
}

variable "source_vpc_route_table_ids" {
  type = list(string)
  default = []
}

variable "destination_vpc_route_table_ids" {
  type = list(string)
  default = []
}

variable "tags_to_apply" {
  default = {}
  type = map(string)
}
