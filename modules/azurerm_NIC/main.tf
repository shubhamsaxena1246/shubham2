
resource "azurerm_network_interface" "NIC" {
  for_each = var.nics
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "IP-for-NIC1"
    subnet_id                     = "/subscriptions/f35f157e-de14-4bc5-b511-c8476e189938/resourceGroups/tinku/providers/Microsoft.Network/virtualNetworks/dev-vnet/subnets/subnet-for-frontened"
    private_ip_address_allocation = "Dynamic"
  }
}