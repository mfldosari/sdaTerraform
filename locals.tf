locals {
  resource_location = "uaenorth"

  virtual_network = {
    name             = "pf-sda-vn"
    address_prefixes = ["10.0.0.0/16"]
  }

  subnets = [
    {
      name           = "public-websubnet"
      address_prefix = ["10.0.0.0/24"]
    },
    {
      name           = "public-appsubnet"
      address_prefix = ["10.0.1.0/24"]
    }
  ]

  tags = {
    managed_by  = "Terraform"
    project     = "SDA Onsite"
    cost_center = "SDA"
  }
}