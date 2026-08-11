variable "rgs" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "vnets" {
  type = map(object({
    name          = string
    location      = string
    rg_name       = string
    address_space = list(string)
  }))
}

variable "subnets" {
  type = map(object({
    subnet_name      = string
    rg_name          = string
    vnet_name        = string
    address_prefixes = list(string)
  }))
}

variable "pips" {
  type = map(object({
    pip_name          = string
    rg_name           = string
    location          = string
    allocation_method = string
  }))
}

variable "vms" {
  type = map(object({
    nic_name       = string
    location       = string
    rg_name        = string
    vm_name        = string
    size           = string
    admin_username = string
    admin_password = string
    subnet_name    = string
    vnet_name      = string
    pip_name       = string


  }))
}

variable "nsgs" {
  type = map(object({
    nsg_name = string
    location = string
    rg_name  = string
    security_rules = optional(list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = optional(string, "*")
      destination_port_range     = optional(string, "*")
      source_address_prefix      = optional(string, "*")
      destination_address_prefix = optional(string, "*")
    })), [])
  }))
}

variable "nsg_associations" {
  type = map(object({
    subnet_name = string
    vnet_name   = string
    rg_name     = string
    nsg_name    = string
  }))
}