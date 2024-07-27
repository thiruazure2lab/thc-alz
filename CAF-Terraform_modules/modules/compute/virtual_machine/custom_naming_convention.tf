###custom naming convention for vm
resource "null_resource" "auto_number_windows" {
  triggers = {
    trig = "noupdate"
  }
  for_each = local.os_type == "windows" && try(var.settings.virtual_machine_settings.windows.auto_name,false) ? var.settings.virtual_machine_settings : {}
  provisioner "local-exec" {
    command = format("%s/autonumbering/scripts.sh", path.module)
    on_failure  = fail
    interpreter = [
      "bash"
    ]
    environment = {
      key                = each.value.vmkey
      RR                 = each.value.regionCode
      AA                 = each.value.countryCode
      LL                 = each.value.lifecycle
      subscription       = each.value.subscription
      tableName          = each.value.tableName
      storageAccountName = each.value.storageAccountName
      type               = each.value.type
      type_code          = each.value.type_code
     }
  }  
}

data "external" "windows_name" {
  #depends_on = [null_resource.auto_number_windows]
  for_each = local.os_type == "windows" && try(var.settings.virtual_machine_settings.windows.auto_name,false)? var.settings.virtual_machine_settings : {}
  #program = ["bash", format("%s/autonumbering/getvmname.sh", path.module)]
  program = ["bash",format("az storage entity show --partition-key %s.%s.%s.%s.%s --row-key %s -t vminventory --account-name %s --subscription 4e8fba9a-9170-45dc-9cea-5c03d95ba729 --account-key xVst6bInt3f9qfpMxTQEajZHuX11QI9Y8rK41TPI0xVIHgxKr2wrAIx0HrSQdTiXSyOgiLKJYegAqDbbjywp1w==",upper(each.value.regionCode),upper(each.value.countryCode),upper(each.value.subscription),upper(each.value.type),upper(each.value.lifecycle),upper(each.value.vmkey),each.value.storageAccountName)]

  # query = {
  #     key                = each.value.vmkey
  #     RR                 = each.value.regionCode
  #     AA                 = each.value.countryCode
  #     LL                 = each.value.lifecycle
  #     subscription       = each.value.subscription
  #     tableName          = each.value.tableName
  #     storageAccountName = each.value.storageAccountName
  #     type               = each.value.type
  #     type_code          = each.value.type_code
  #     depends            = null_resource.auto_number_windows["windows"].id
  # }
}
######### Linux
resource "null_resource" "auto_number_linux" {
  triggers = {
    trig = "noupdate"
  }
  for_each = local.os_type == "linux" && try(var.settings.virtual_machine_settings.linux.auto_name,false) ? var.settings.virtual_machine_settings : {}
  provisioner "local-exec" {
    command = format("%s/autonumbering/scripts.sh", path.module)
    on_failure  = fail
    interpreter = [
      "bash"
    ]
    environment = {
      key                = each.value.vmkey
      RR                 = each.value.regionCode
      AA                 = each.value.countryCode
      LL                 = each.value.lifecycle
      subscription       = each.value.subscription
      tableName          = each.value.tableName
      storageAccountName = each.value.storageAccountName
      type               = each.value.type
      type_code          = each.value.type_code
     }
  }  
}
data "external" "linux_name" {
  #depends_on = [null_resource.auto_number_linux]
  for_each = local.os_type == "linux" && try(var.settings.virtual_machine_settings.linux.auto_name,false)? var.settings.virtual_machine_settings : {}
  #program = ["bash", format("%s/autonumbering/getvmname.sh", path.module)]
  program = ["bash","-c",format("az storage entity show --partition-key %s.%s.%s.%s.%s --row-key %s -t vminventory --account-name %s --subscription 4e8fba9a-9170-45dc-9cea-5c03d95ba729 --account-key xVst6bInt3f9qfpMxTQEajZHuX11QI9Y8rK41TPI0xVIHgxKr2wrAIx0HrSQdTiXSyOgiLKJYegAqDbbjywp1w==",upper(each.value.regionCode),upper(each.value.countryCode),upper(each.value.subscription),upper(each.value.type),upper(each.value.lifecycle),upper(each.value.vmkey),each.value.storageAccountName)]

  # query = {
  #     key                = each.value.vmkey
  #     RR                 = each.value.regionCode
  #     AA                 = each.value.countryCode
  #     LL                 = each.value.lifecycle
  #     subscription       = each.value.subscription
  #     tableName          = each.value.tableName
  #     storageAccountName = each.value.storageAccountName
  #     type               = each.value.type
  #     type_code          = each.value.type_code
  #     depends            = null_resource.auto_number_linux["linux"].id
  # }
}
#######################