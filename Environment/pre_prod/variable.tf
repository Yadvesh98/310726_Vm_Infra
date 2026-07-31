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
    admin_username     = string
    admin_password = string
    subnet_name    = string
    vnet_name      = string
    pip_name       = string


  }))
}