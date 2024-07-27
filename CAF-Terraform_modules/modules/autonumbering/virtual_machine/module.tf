locals {
  windows_vm_name = flatten([for key,value in var.virtual_machines:
                        [for k,v in value.virtual_machine_settings: parseint(substr(v.name,-3,length(v.name)),10)]
                        if value.os_type == "windows" && try(!value.test_vm,true)])
  linux_vm_name = flatten([for key,value in var.virtual_machines:
                        [for k,v in value.virtual_machine_settings: parseint(substr(v.name,-3,length(v.name)),10)]
                        if value.os_type == "linux" && try(!value.test_vm,true)])

  windows_dmz = [for i in local.windows_vm_name: i 
                  if i > 899]
  
  windows_ndmz = [for i in local.windows_vm_name: i 
                  if i < 900]
  
  linux_dmz = [for i in local.linux_vm_name: i 
                  if i > 899]
  linux_ndmz = [for i in local.linux_vm_name: i 
                  if i < 900]
}

locals {
  trigger = join(" ",local.windows_ndmz,local.windows_ndmz,local.linux_dmz,local.linux_ndmz)
  map_object = {
    windows_nondmz = local.windows_ndmz
    windows_dmz    = local.windows_dmz
    linux_nondmz   = local.linux_ndmz
    linux_dmz      = local.linux_dmz
  }
}

resource "null_resource" "auto_number" {
  triggers = {
    trig = local.trigger
  }
  for_each = local.map_object
  provisioner "local-exec" {
    command = format("%s/../scripts/update.sh", path.module)
    on_failure  = fail
    interpreter = [
      "bash"
    ]
    environment = {
      item               = join(" ",each.value)
      RR                 = var.vm_name_config.regionCode
      AA                 = var.vm_name_config.countryCode
      LL                 = var.vm_name_config.lifecycle
      subscription       = var.vm_name_config.subscription
      tableName          = var.autonumber_storage_config.tableName
      storageAccountName = var.autonumber_storage_config.storageAccountName
      type               = each.key
     }
  }  
}