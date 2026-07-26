rg1 = {
   module = {
    name = "tinku"
    location = "UK South"
   }
}
rg1 = {
   module = {
    name = "tinku"
    location = "UK South"
   }
}

vnet1 = {
    module = {
    name = "dev-vnet"
    address_space = ["10.0.0.0/16"]
    resource_group_name = "tinku"
    location = "UK South"

}
}
snet-mains = {
    module = {
    name = "subnet-for-frontened"
    resource_group_name = "tinku"
    virtual_network_name = "dev-vnet"
    address_prefixes =["10.0.1.0/24"]
    }
    module1 = {
    name = "subnet-for-backened"
    resource_group_name = "tinku"
    virtual_network_name = "dev-vnet"
    address_prefixes =["10.0.2.0/24"]
    }

}
nics2 = {
    module1 ={
    nic_name = "NIC1-frontened1"
    vm_name = "ff1"
    location = "UK South"
    resource_group_name = "tinku"
    subnet_name = "subnet-for-frontened"
    virtual_network_name = "dev-vnet"
    pip_name = "public-ip-for-frontened"
    admin_username = "shubham1246"
    admin_password = "C6e67e94$$$$"
    vm_size = "Standard_DS1_v2"
    computer_name  = "fontend_vm..2"
    allocation_method   = "Static"
    
    }
    module2 ={
    nic_name = "NIC1-backend"
    vm_name = "ff"
    location = "UK South"
    resource_group_name = "tinku"
    subnet_name = "subnet-for-backened"
    virtual_network_name = "dev-vnet"
    pip_name = "public-ip-for-backened"
    admin_username = "shubham1246"
    admin_password = "C6e67e94$$$$"
    vm_size = "Standard_DS1_v2"
    computer_name  = "fontend_vm..1"
    allocation_method   = "Static"
    }
}
pips2 = {
    module ={
        name                = "public-ip-for-frontened"
        resource_group_name = "tinku"
        location            = "UK South"
        allocation_method   = "Static"
  
    }
    module2 ={
        name                = "public-ip-for-backened"
        resource_group_name = "tinku"
        location            = "UK South"
        allocation_method   = "Static"
  
    }
}
