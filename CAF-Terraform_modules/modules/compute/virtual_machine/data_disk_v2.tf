module "data_disksv2" {
  source = "./data_disksv2"
  for_each = lookup(var.settings, "data_disksv2", {})

  name                = each.value.name
  global_settings     = var.global_settings
  resource_group_name = var.resource_group_name
  location            = var.location
  settings            = each.value
  base_tags           = var.base_tags
  virtual_machine_id  = local.os_type == "linux" ? azurerm_linux_virtual_machine.vm["linux"].id : azurerm_windows_virtual_machine.vm["windows"].id
}

/* resource "azurerm_virtual_machine_data_disk_attachment" "data_disksv2" {
  for_each = lookup(var.settings, "data_disksv2", {})

  managed_disk_id           = module.data_disksv2[each.key].id
  virtual_machine_id        = local.os_type == "linux" ? azurerm_linux_virtual_machine.vm["linux"].id : azurerm_windows_virtual_machine.vm["windows"].id
  lun                       = each.value.lun
  caching                   = lookup(each.value, "caching", "None")
  write_accelerator_enabled = lookup(each.value, "write_accelerator_enabled", false)
} */