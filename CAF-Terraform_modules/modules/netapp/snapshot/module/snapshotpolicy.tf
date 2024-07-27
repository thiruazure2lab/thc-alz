resource "azurerm_netapp_snapshot_policy" "snapshotpolicy" {
  name                = var.settings.name
  location            = var.location
  resource_group_name = var.resource_group_name
  account_name        = var.account_name
  enabled             = try(var.settings.enabled,true)

  dynamic "hourly_schedule" {
    for_each = lookup(var.settings, "hourly_schedule", null) == null ? [] : [1]

    content {
      snapshots_to_keep = lookup(var.settings.hourly_schedule,"snapshots_to_keep",null)
      minute      = lookup(var.settings.hourly_schedule,"minute",null)
    }
  }

  dynamic "daily_schedule" {
    for_each = lookup(var.settings, "daily_schedule", null) == null ? [] : [1]
    content {
      snapshots_to_keep = lookup(var.settings.daily_schedule,"snapshots_to_keep",null)
      hour        = lookup(var.settings.daily_schedule,"hour",null)
      minute      = lookup(var.settings.daily_schedule,"minute",null)
    }
  }

  dynamic "weekly_schedule" {
    for_each = lookup(var.settings, "weekly_schedule", null) == null ? [] : [1]
    content {
      snapshots_to_keep = lookup(var.settings.weekly_schedule,"snapshots_to_keep",null)
      hour        = lookup(var.settings.weekly_schedule,"hour",null)
      minute      = lookup(var.settings.weekly_schedule,"minute",null)
      days_of_week = lookup(var.settings.weekly_schedule,"days_of_week",null)
    }
  }

  dynamic "monthly_schedule" {
    for_each = lookup(var.settings, "monthly_schedule", null) == null ? [] : [1]
    content {
      snapshots_to_keep = lookup(var.settings.monthly_schedule,"snapshots_to_keep",null)
      hour        = lookup(var.settings.monthly_schedule,"hour",null)
      minute      = lookup(var.settings.monthly_schedule,"minute",null)
      days_of_month = lookup(var.settings.monthly_schedule,"days_of_month",null)
    }
  }
}



resource "null_resource" "volume_associate_snapshotpolicy" {
  triggers = {
    trig = "static"
  }
  depends_on = [
    azurerm_netapp_volume.volume
  ]
  for_each = lookup(var.settings, "data_protection_snapshot_policy",null) == null ? [] : [1]
  provisioner "local-exec" {
    command = format("%s/scripts/associate_snapshot_policy.sh",path.module)
    on_failure  = fail
    interpreter = [
      "bash"
    ]
    environment = {
      resource_group_name      = var.resource_group_name
      netApp_account_name      = var.account_name
      pool_name                = var.pool_name
      volume_name              = var.settings.name
      snapshot_policy_id       = var.snapshot_policy[var.settings.data_protection_snapshot_policy.snapshot_policy_key].id
     }
  }  
}