variable "vms" {
type = map(object({
    nic_name = string
    location = string
    rg_name = string
    vm_name = string
    size = string
    admin_username = string
    admin_password = string
    subnet_name = string
    vnet_name = string
    pip_name = string


}))
}