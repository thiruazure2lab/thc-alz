resource "azurecaf_name" "shared_disk" {
  # for_each = lookup(var.settings, "shared_disk", {})

  name          = var.name
  resource_type = "azurerm_managed_disk"
  prefixes      = var.global_settings.prefixes
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
}

resource "azurerm_template_deployment" "shared_disk" {
  # for_each = lookup(var.settings, "shared_disk", {})
  name                = var.name
  resource_group_name = var.resource_group_name

  template_body   = file(local.arm_filename)
  parameters_body = jsonencode(local.parameters_body)
  /* parameters = {
    diskName = each.value.name
    location = var.location
    sku = each.value.sku
    diskSizeGb = tonumber(each.value.diskSizeGb)
    createOption = each.value.createOption
    hyperVGeneration  = try(each.value.hyperVGeneration, "V1")
    diskEncryptionSetType = try(each.value.diskEncryptionSetType, "EncryptionAtRestWithPlatformKey")
    maxShares = tonumber(each.value.maxShares)
    dataAccessAuthMode = try(each.value.dataAccessAuthMode, "None")
    networkAccessPolicy = try(each.value.networkAccessPolicy, "DenyAll")
    publicNetworkAccess = try(each.value.publicNetworkAccess, "Disabled")
    resourceGroupName = var.resource_group_name
    # sharedDiskTags = try(local.tags, null)
  } */

  deployment_mode = "Incremental"

  timeouts {
    create = "10h"
    update = "10h"
    delete = "10h"
    read   = "5m"
  }
}
/* 
resource "azurerm_virtual_machine_data_disk_attachment" "shareddisk" {
  # for_each = lookup(var.settings, "shared_disk", {})

  managed_disk_id           = lookup(azurerm_template_deployment.shared_disk.outputs, "id")
  virtual_machine_id        = var.virtual_machine_id
  lun                       = var.settings.lun
  caching                   = lookup(var.settings, "caching", "None")
  write_accelerator_enabled = lookup(var.settings, "write_accelerator_enabled", false)
}
 */