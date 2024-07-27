resource "azuread_group" "group" {

  display_name            = var.global_settings.passthrough ? format("%s", var.azuread_groups.name) : format("%s%s", try(format("%s-", var.global_settings.prefixes.0), ""), var.azuread_groups.name)
  description             = lookup(var.azuread_groups, "description", null)
  prevent_duplicate_names = lookup(var.azuread_groups, "prevent_duplicate_names", null)
}


data "azuread_group" "parent_group"{
  for_each = try(var.azuread_groups.parent_group,null)==null?toset([]):toset(["enabled"])
  display_name = var.azuread_groups.parent_group
}

resource "azuread_group_member" "p2" {
  for_each = try(var.azuread_groups.parent_group,null)==null?toset([]):toset(["enabled"])
  group_object_id  = data.azuread_group.parent_group["enabled"].id
  member_object_id = azuread_group.group.id
}

resource "null_resource" "access_package" {
  triggers = {
    trig = "static"
  }
  for_each = try(var.access_package,{})
  provisioner "local-exec" {
    command = format("%s/scripts/access_package.sh",path.module)
    on_failure  = fail
    interpreter = [
      "bash"
    ]
    environment = {
      access_package      = try(each.value.name,var.access_package_name)
      access_catalogId    = try(each.value.catalogId,"12987dd2-2a02-4e6d-a7c8-0d66b0a62c3d") #catalog id of RBAC-Application ROle
      access_description  = try(each.value.description,azuread_group.group.display_name)
      groupId             = azuread_group.group.id
      primaryApproverId   = each.value.primaryApproverId
      secondaryApproverId = try(each.value.secondaryApproverGroupId,"4fb6fd38-b14c-463d-a1cb-0e540ed9d39d") #object id of MPG-AZSG-GS-Approver group
     }
  }  
}
