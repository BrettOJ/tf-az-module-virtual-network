#variable file for an Azure virtual network  
variable "resource_groups" {
  type = map(any)
  default = null
}

variable "address_space" {
  type = list(string)
  default = [""]
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
  type = map(any)
  default = null
}

variable "encryption" {
  type = map(any)
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

