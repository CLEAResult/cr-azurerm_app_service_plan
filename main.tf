resource "azurerm_app_service_plan" "plan" {
  name                = "${local.name}${format("%03d", count.index + 1)}"
  count               = "${var.count}"
  location            = "${var.location}"
  resource_group_name = "${var.rg_name}"
  kind                = "${var.kind}"
  reserved            = true

  sku {
    tier = "${var.tier}"
    size = "${var.size}"
  }

  lifecycle {
    ignore_changes = [
      "tags",
    ]
  }

  tags {
    InfrastructureAsCode = "True"
  }
}
