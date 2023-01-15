data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "kv" {
  name                        = "${var.env}-${var.region_name}-${var.instance}-kv"
  location                    = var.region
  resource_group_name         = "${var.env}-${var.region_name}-${var.instance}-rg"
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}