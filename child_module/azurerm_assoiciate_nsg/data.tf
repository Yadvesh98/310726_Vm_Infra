data "azurerm_subnet" "subnet_data" {
  for_each             = var.nsg_associations
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_network_security_group" "nsg_data" {
  for_each            = var.nsg_associations
  name                = each.value.nsg_name
  resource_group_name = each.value.rg_name
}
