module "vnet_name" {
  source        = "git::https://dev.azure.com/innersource/Merlion/_git/tf-module-az-naming-convention?ref=main"
  name_format   = "res_type|-|project_code|-|env|zone|tier|-|name"
  resource_type = "vnet"
  naming_convention_info = {
    "${var.naming_convention_info.name}" = {
      name_info = var.naming_convention_info
      tags = var.tags
    }
  }
}