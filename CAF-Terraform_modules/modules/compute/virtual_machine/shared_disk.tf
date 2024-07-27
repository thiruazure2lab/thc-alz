module "shared_disk" {
  source = "./shared_disk"
  for_each = {
    for key, value in lookup(var.settings, "shared_disk", {}) : key => value
    if try(value.reuse, false) == false
  }

  # for_each            = lookup(var.settings, "shared_disk", {})
  name                = each.value.name
  global_settings     = var.global_settings
  resource_group_name = var.resource_group_name
  location            = var.location
  settings            = each.value
  base_tags           = var.base_tags
  virtual_machine_id  = local.os_type == "linux" ? azurerm_linux_virtual_machine.vm["linux"].id : azurerm_windows_virtual_machine.vm["windows"].id
}