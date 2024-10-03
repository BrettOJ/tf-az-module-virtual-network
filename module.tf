# Module file for an Azure virtual network

resource "azurerm_virtual_network" "vnet" {
  name                = module.vnet_name.naming_convention_output[var.naming_convention_info.name].names.0
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  bgp_community       = var.bgp_community
  edge_zone = var.edge_zone
  flow_timeout_in_minutes = var.flow_timeout_in_minutes
  tags = var.tags
  dynamic "ddos_protection_plan" {
    for_each = var.ddos_protection_plan == null ? [] : [1]
    content {
      id     = var.ddos_protection_plan.id
      enable = var.ddos_protection_plan.enable
    }
  }
  dynamic "encryption"  {
    for_each = var.encryption == null ? [] : [1]
    content {
      enforcement = var.encryption.enforcement
    }
  }
}

resource "azurerm_subnet" "subnet" {
  for_each = { for subnet in var.subnets : subnet.name => subnet }
  #for_each = var.subnets == null ? [] : [var.subnets]
  name                 = each.value.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = each.value.address_prefixes
  delegation {
    name = each.value.delegation.name
    service_delegation {
      name = each.value.delegation.service_delegation.name
      actions = each.value.delegation.service_delegation.actions
    }
  }
  private_endpoint_network_policies = each.value.private_endpoint_network_policies
  private_link_service_network_policies_enabled = each.value.private_link_service_network_policies_enabled
  service_endpoints = each.value.service_endpoints
  service_endpoint_policy_ids = each.value.service_endpoint_policy_ids
}