resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
  for_each                  = var.nsg_associations
  subnet_id                 = data.azurerm_subnet.subnet_data[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg_data[each.key].id
}
