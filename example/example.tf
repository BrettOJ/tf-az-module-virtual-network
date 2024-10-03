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
  source              = "../" #"git::https://github.com/BrettOJ/tf-az-module-virtual-network?ref=main"
  location            = var.location
  resource_group_name = module.resource_groups.rg_output[1].name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  naming_convention_info = local.naming_convention_info
  tags = {
    environment = "Production"
  }

  subnets = {
    1 = {
      name = "subnet1"
      address_prefixes = ["10.0.1.0/24"]
      delegation = {
        name = "delegation1"
        service_delegation = {
          name = "Microsoft.Web/serverFarms"
          actions = null
        }
      }
      private_endpoint_network_policies = null
      private_link_service_network_policies_enabled = false
      service_endpoints = null
      service_endpoint_policy_ids = null
    }
    2 = {
      name = "subnet2"
      address_prefixes = ["10.0.2.0/24"]
      delegation = {
        name = "delegation2"
        service_delegation = {
          name = "Microsoft.Web/serverFarms"
          actions = null
        }
      }
      private_endpoint_network_policies = null
      private_link_service_network_policies_enabled = false
      service_endpoints = null
      service_endpoint_policy_ids = null
    }
  }
}

