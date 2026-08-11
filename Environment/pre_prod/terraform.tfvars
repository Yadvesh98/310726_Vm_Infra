rgs = {
  rg1 = {
    name     = "pre-prod_rg"
    location = "centralindia"
  }
}

vnets = {
  vnet1 = {
    name          = "pre-prod-vnet1"
    location      = "centralindia"
    rg_name       = "pre-prod_rg"
    address_space = ["10.0.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    subnet_name      = "frontend-subnet"
    rg_name          = "pre-prod_rg"
    vnet_name        = "pre-prod-vnet1"
    address_prefixes = ["10.0.1.0/24"]
  }
  subnet2 = {
    subnet_name      = "backend-subnet"
    rg_name          = "pre-prod_rg"
    vnet_name        = "pre-prod-vnet1"
    address_prefixes = ["10.0.2.0/24"]
  }
}
pips = {
  pip1 = {
    pip_name          = "frontend-ip"
    rg_name           = "pre-prod_rg"
    location          = "centralindia"
    allocation_method = "Static"
  }
}

vms = {
  vm1 = {
    nic_name       = "frontend-nic"
    location       = "centralindia"
    rg_name        = "pre-prod_rg"
    vm_name        = "frontend-vm"
    size           = "Standard_D4_v5"
    admin_username = "adminuser"
    admin_password = "Admin@123456"
    subnet_name    = "frontend-subnet"
    vnet_name      = "pre-prod-vnet1"
    pip_name       = "frontend-ip"

  }
}

nsgs = {
  nsg1 = {
    nsg_name = "frontend-nsg"
    location = "centralindia"
    rg_name  = "pre-prod_rg"
    security_rules = [
      {
        name                       = "Allow-SSH"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Allow-HTTP"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}

nsg_associations = {
  assoc1 = {
    subnet_name = "frontend-subnet"
    vnet_name   = "pre-prod-vnet1"
    rg_name     = "pre-prod_rg"
    nsg_name    = "frontend-nsg"
  }
}