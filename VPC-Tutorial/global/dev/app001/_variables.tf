variable "default_tags" {
  default = {
    costcenter = "sriauronet"
    ManagedBy = "Terraform"
    environment = "dev"
    TFRepoDirectory = "global/dev/app001"
  }
  type = map(string)
}