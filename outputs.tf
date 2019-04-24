output "id" {
  value = ["${azurerm_app_service_plan.plan.*.id}"]
}

output "name" {
  value = ["${azurerm_app_service_plan.plan.*.name}"]
}
