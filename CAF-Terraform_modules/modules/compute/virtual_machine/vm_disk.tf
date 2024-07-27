resource "azurecaf_name" "disk" {
  for_each = lookup(var.settings, "data_disks", {})

  name          = try(each.value.auto_name,false)?try(format("%s_%s",data.external.windows_name["windows"].result.name,each.value.suffix),format("%s_%s",data.external.linux_name["linux"].result.name,each.value.suffix)):each.value.name
  resource_type = "azurerm_managed_disk"
  prefixes      = var.global_settings.prefixes
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
  use_slug      = var.global_settings.use_slug
}

resource "azurerm_managed_disk" "disk" {
  for_each = lookup(var.settings, "data_disks", {})

  name                   = azurecaf_name.disk[each.key].result
  location               = var.location
  resource_group_name    = var.resource_group_name
  storage_account_type   = each.value.storage_account_type
  create_option          = each.value.create_option
  source_resource_id     = try(each.value.source_resource_id, null)
  image_reference_id     = try(each.value.image_reference_id,null)
  disk_size_gb           = each.value.disk_size_gb
  zones                  = try(each.value.zones, null)
  disk_iops_read_write   = try(each.value.disk_iops_read_write, null)
  disk_mbps_read_write   = try(each.value.disk.disk_mbps_read_write, null)
  tags                   = local.tags
  disk_encryption_set_id = try(each.value.disk_encryption_set_key, null) == null ? null : var.disk_encryption_sets[try(each.value.lz_key, var.client_config.landingzone_key)][each.value.disk_encryption_set_key].id

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "azurerm_virtual_machine_data_disk_attachment" "disk" {
  for_each = lookup(var.settings, "data_disks", {})

  managed_disk_id           = azurerm_managed_disk.disk[each.key].id
  virtual_machine_id        = local.os_type == "linux" ? azurerm_linux_virtual_machine.vm["linux"].id : azurerm_windows_virtual_machine.vm["windows"].id
  lun                       = each.value.lun
  caching                   = lookup(each.value, "caching", "None")
  write_accelerator_enabled = lookup(each.value, "write_accelerator_enabled", false)
}