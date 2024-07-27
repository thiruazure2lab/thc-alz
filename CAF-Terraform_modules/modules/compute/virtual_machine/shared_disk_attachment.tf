resource "azurerm_virtual_machine_data_disk_attachment" "shareddisk" {
  #for_each = lookup(var.settings, "shared_disk", {})
  for_each = {
    for key, value in lookup(var.settings, "shared_disk", {}) : key => value
    if try(value.attachment, true) == true
  }

  managed_disk_id           = try(module.shared_disk[each.key].id,each.value.managed_disk_id)
  virtual_machine_id        = local.os_type == "linux" ? azurerm_linux_virtual_machine.vm["linux"].id : azurerm_windows_virtual_machine.vm["windows"].id
  lun                       = each.value.lun
  caching                   = lookup(each.value, "caching", "None")
  write_accelerator_enabled = lookup(each.value, "write_accelerator_enabled", false)
}