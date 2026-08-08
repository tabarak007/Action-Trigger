resource "azurerm_public_ip" "net" {
    for_each = var.public
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
}