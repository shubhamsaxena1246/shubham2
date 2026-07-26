module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  resource_groups = var.rg1
}
module "virtual_network" {
    depends_on = [module.resource_group]
    source = "../../modules/azurerm_vnet"
    virtual_network = var.vnet1
  
}
module "snet" {
  depends_on = [module.virtual_network]
  source = "../../modules/azurerm_subnet"
  subnets = var.snet-mains
  
}
module "pip" {
  depends_on = [module.snet]
  source = "../../modules/azurerm_publicip"
  pips = var.pips2
  
}

module "NIC" {
  depends_on = [module.pip]
  source = "../../modules/azurerm_NIC"
  nics = var.nics2
}

