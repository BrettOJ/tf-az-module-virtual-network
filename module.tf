# Module file for an Azure virtual network

resource "azurerm_virtual_network" "vnet" {
  name                = module.vnet_name.naming_convention_output[var.naming_convention_info.name].names.0
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  ddos_protection_plan = var.ddos_protection_plan
  encryption           = var.encryption
  edge_zone = var.edge_zone
  flow_timeout_in_minutes = var.flow_timeout_in_minutes
  tags = var.tags
}
 
