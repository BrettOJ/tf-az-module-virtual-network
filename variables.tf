variable "location" {
  type = string
  default = "southeastasia"
  description = "value for the location of the resource"
}

variable "resource_group_name" {
  type = string
  default = "rg"
  description = "value for the name of the resource group"
}
variable "address_space" {
  type = list(string)
  default = null
  description = "value for the address space of the virtual network"
}
variable "bgp_community" {
  type = string
  default = null
  description = "value for the BGP community of the virtual network"
}
  
variable "ddos_protection_plan" {
  type = object({
    id = string
    enable = bool
  })
  default = null
  description = "value for the DDoS protection plan of the virtual network"
}

variable "encryption" {
  type = object({
    enforcement = string
  })  
  default = null
  description = "value for the encryption of the virtual network"
}

variable "dns_servers" {
  type = list(string)
  default = null
  description = "value for the DNS servers of the virtual network"
}

variable "edge_zone" {
  type = string
  default = null
  description = "value for the edge zone of the virtual network"
}

variable "flow_timeout_in_minutes" {
  type = number
  default = null
  description = "value for the flow timeout in minutes of the virtual network"
}

variable "tags" {
  type = map(any)
  default = null
  description = "value for the tags of the virtual network"
}

variable "naming_convention_info" {
  type = map(any)
  default = null
}
