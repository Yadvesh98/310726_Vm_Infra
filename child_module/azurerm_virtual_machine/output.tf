output "public_ips" {
  value = {
    for k, v in data.azurerm_public_ip.data_pip :
    k => v.ip_address
  }
}

output "subnet_ids" {
  value = {
    for k, v in data.azurerm_subnet.subnet_data :
    k => v.id
  }
}