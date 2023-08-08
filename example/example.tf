locals {
  naming_convention_info = {
    project_code = "project_code"
    env          = "env"
    zone         = "zone"
    tier         = "tier"
    name         = "name"
  }
}
module "resource_groups" {
  source = "git::https://github.com/BrettOJ/tf-az-module-resource-group?ref=main"
  resource_groups = {
    1 = {
      name                   = var.resource_group_name
      location               = var.location
      naming_convention_info = local.naming_convention_info
      tags = {
      }
    }
  }
}


module "azure_virtual_network"  {
  source              = "git::https://github.com/BrettOJ/tf-az-module-virtual-network?ref=main"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  naming_convention_info = local.naming_convention_info
  tags = {
    environment = "Production"
  }
}
