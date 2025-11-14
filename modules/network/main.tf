resource "azurerm_virtual_network" "virtual_network" {
  for_each            = var.network
  name                = each.value.name
  address_space       = each.value.address_space
  location            = each.value.location
  resource_group_name = each.value.rg_name


  # dynamic creation of subnets
  dynamic "subnets" {
    for_each = each.value.subnets
    content {
      name             = subnets.value.name
      address_prefixes = subnets.value.address_prefixes
    }
  }
}

# # NSG
# resource "azurerm_network_security_group" "nsg" {
#   for_each            = var.nsg
#   name                = each.value.name
#   location            = each.value.location
#   resource_group_name = each.value.rg_name
# }

# # associate NSG to subnets using dynamic for_each
# resource "azurerm_subnet_network_security_group_association" "assoc" {
#   for_each                  = azurerm_subnet.subnets
#   subnet_id                 = each.value.id
#   network_security_group_id = azurerm_network_security_group.this.id
# }
