resource "azurerm_app_service_plan" "plan" {
  name                = format("%s%03d", local.name, count.index + 1)
  count               = var.num
  location            = var.location
  resource_group_name = var.rg_name
  kind                = var.kind
  reserved            = local.reserved

  sku {
    tier     = local.tier
    size     = local.size
    capacity = local.capacity
  }

  lifecycle {
    ignore_changes = [tags]
  }

  tags = {
    InfrastructureAsCode = "True"
  }
}

