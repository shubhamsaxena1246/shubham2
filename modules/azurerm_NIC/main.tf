data "azurerm_subnet" "snet" {
    for_each = var.nics
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
data "azurerm_public_ip" "publicip" {
    for_each = var.nics
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_network_interface" "NIC" {
  for_each = var.nics
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  

  ip_configuration {
    name                         = "dhondu"
    subnet_id                     = data.azurerm_subnet.snet[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.publicip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_virtual_machine" "rg-vms" {
    for_each = var.nics
  name                  = each.value.vm_name
  resource_group_name   = each.value.resource_group_name
  location              = each.value.location
   os_profile {
  computer_name         = each.value.computer_name
  admin_username        = each.value.admin_username
  admin_password        = each.value.admin_password
   }
   os_profile_linux_config {
  disable_password_authentication = false
   }
  network_interface_ids = [azurerm_network_interface.NIC[each.key].id]
   vm_size               = each.value.vm_size
  
  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  
  
}