

resource "azurerm_resource_group" "thiru_rg" {
  name     = "thiruvpc1-rg"
  location = "uksouth"
}
resource "azurerm_virtual_network" "thiruvpc1" {
  name                = "devvpc1"
  location            = azurerm_resource_group.thiru_rg.location
  resource_group_name = azurerm_resource_group.thiru_rg.name
  address_space       = ["10.0.0.0/16"]

}

