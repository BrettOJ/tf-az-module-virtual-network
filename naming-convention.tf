#storage account container name
module "vnet_name" {
  source      = "git::https://github.com/BrettOJ/tf-az-module-naming-convention?ref=main"
  name_format = "res_type|-|project_code|-|env|zone|tier|-|name"
  naming_convention_info = {
    for key, value in var.resource_groups :
    "${key}" => {
      name_info = merge(value.naming_convention_info, { name = value.name })
      tags      = value.tags
    }
  }
  resource_type = "vnet"
}
