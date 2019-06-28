resource "azurerm_app_service_plan" "plan" {
  name                = format("%s%03d", local.name, count.index + 1)
  count               = var.num
  location            = var.location
  resource_group_name = var.rg_name
  kind                = var.kind
  reserved            = local.reserved

  sku {
    tier = var.tier
    size = var.size
  }

  lifecycle {
    ignore_changes = [tags]
  }

  tags = {
    InfrastructureAsCode = "True"
  }
}

