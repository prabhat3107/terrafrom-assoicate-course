variable "default_tags" {
  default = {
    TFRepoDirectory = "global/dev/app001/transit-gateway-peering"
  }
  type = map(string)
}
