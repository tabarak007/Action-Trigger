module "resource_group" {
  source   = "../../Module/resource_group"
  rg      = var.rg
}
module "vnet" {
  source              = "../../Module/virtual_network"
  depends_on          = [module.resource_group]
  vnet               = var.vnet
}
module "super" {
  source               = "../../Module/subnet"
  depends_on           = [module.vnet, module.resource_group]
  subnet               = var.subnet
}
module "public_ip" {
  source     = "../../Module/public_ip"
  depends_on = [module.super]
  public     = var.public

}
module "netowrk" {
  source     = "../../Module/nic"
  depends_on = [module.public_ip]
  nic        = var.nic
}
module "computer" {
  source     = "../../Module/virtual_machine"
  depends_on = [module.netowrk]
  vms        = var.vms
}
