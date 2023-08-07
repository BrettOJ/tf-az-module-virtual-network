#variable file for an Azure virtual network  

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
  default = "vnet-rg"
}

variable "bgp_community" {
  type = string
  default = ""
}
  
variable "ddos_protection_plan" {
  type = map(any)
  default = {
    id = ""
    enable = false
  }
}

variable "encryption" {
  type = map(any)
  default = {
    enforcement = ""
  }
}

variable "dns_servers" {
  type = list(string)
  default = [""]
}

variable "edge_zone" {
  type = string
  default = ""
}

variable "flow_timeout_in_minutes" {
  type = number
  default = 4
}

variable "tags" {
  type = map(any)
  default = {
    environment = "dev"
  }
}

