module "vnet_name" {
  source        = "git::https://github.com/BrettOJ/tf-az-module-naming-convention?ref=main"
  name_format   = "res_type|-|project_code|-|env|zone|tier|-|name"
  resource_type = "vnet"
  naming_convention_info = {
    "${var.naming_convention_info.name}" = {
      name_info = var.naming_convention_info
      tags = var.tags
    }
  }
}