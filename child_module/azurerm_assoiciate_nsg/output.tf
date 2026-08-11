output "nsg_associations" {
  value = { for k, v in azurerm_subnet_network_security_group_association.nsg_assoc : k => v.id }
}
