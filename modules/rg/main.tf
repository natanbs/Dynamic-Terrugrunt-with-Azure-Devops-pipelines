resource "azurerm_resource_group" "main" {
#   name     = var.resource_group
  name = "${var.env}-${var.region_name}-${var.instance}-rg"
  location = var.region

  tags = {
    environment = var.env
  }
}
