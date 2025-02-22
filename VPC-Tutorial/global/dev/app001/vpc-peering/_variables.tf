variable "default_tags" {
  default = {
    TFRepoDirectory = "global/dev/app001/vpc-peering"
  }
  type = map(string)
}
