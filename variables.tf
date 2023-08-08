#variable file for an Azure virtual network  
variable "resource_groups" {
  type = map(any)
  default = null
}

variable "address_space" {
  type = list(string)
}

variable "location" {
  type = string
  default = "southeastasia"
}

variable "resource_group_name" {
  type = string
  default = "rg"
}

variable "bgp_community" {
  type = string
  default = null
}
  
variable "ddos_protection_plan" {
  type = object({
    id = string
    enable = bool
  })
  default = null
}

variable "encryption" {
  type = object({
    enforcement = string
  })  
  default = null
}

variable "dns_servers" {
  type = list(string)
  default = null
}

variable "edge_zone" {
  type = string
  default = null
}

variable "flow_timeout_in_minutes" {
  type = number
  default = null
}

variable "tags" {
  type = map(any)
  default = null
}

variable "naming_convention_info" {
  type = map(any)
  default = null
}