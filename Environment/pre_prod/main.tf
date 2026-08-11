module "rg" {
  source = "../../child_module/azurerm_resource_group"
  rgs    = var.rgs
}
module "vnet" {
  depends_on = [module.rg]
  source     = "../../child_module/azurerm_virtual_network"
  vnets      = var.vnets
}
module "subnet" {
  depends_on = [module.vnet]
  source     = "../../child_module/azurerm_subnet"
  subnets    = var.subnets
}
module "pip" {
  depends_on = [module.rg]
  source     = "../../child_module/azurerm_public_ip"
  pips       = var.pips
}
module "nsg" {
  depends_on = [module.rg]
  source     = "../../child_module/azurerm_network_security_group"
  nsgs       = var.nsgs
}
module "nsg_association" {
  depends_on       = [module.subnet, module.nsg]
  source           = "../../child_module/azurerm_assoiciate_nsg"
  nsg_associations = var.nsg_associations
}
module "vm" {
  depends_on = [module.subnet, module.pip, module.rg]
  source     = "../../child_module/azurerm_virtual_machine"
  vms        = var.vms
}