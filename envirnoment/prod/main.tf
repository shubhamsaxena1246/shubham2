variable rg1{}
variable "vnet1" {}

module "resource_group" {
  source = "../../terraform/azurerm_resourcegroup"
  resource_groups = var.rg1
}
module "virtual_network" {
    depends_on = [module.resource_group]
    source = "../../terraform/azurerm_vnet"
    virtual_network = var.vnet1
  
}