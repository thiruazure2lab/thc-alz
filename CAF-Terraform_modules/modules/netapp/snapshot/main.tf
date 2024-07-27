terraform {
  required_providers {
    azurecaf = {
      source = "aztfmod/azurecaf"
    }
  }
  required_version = ">= 0.13"
}

locals {
  module_tag = {
    "module" = basename(abspath(path.module))
  }
  tags         = merge(var.base_tags, local.module_tag, try(var.settings.tags, null))
  arm_filename = "${path.module}/snapshot_policy.json"

  # this is the format required by ARM templates
  parameters_body = {
    SnapshotPolicyName = {
      value = var.settings.name
    }
    location = {
      value = var.location
    }
    NetAppAccName = {
      value = var.account_name
    }
    SnapshotPolicyTags = {
      value = local.tags
    }
    DailyScheduleHour = {
      value = try(var.settings.daily_schedule.hour,0)
    }
    DailyScheduleMinute = {
      value = try(var.settings.daily_schedule.minute,0)
    }
    DailyScheduleSnapshotsToKeep = {
      value = try(var.settings.daily_schedule.snapshots_to_keep,0)
    }
    HourlyScheduleMinute = {
      value = try(var.settings.hourly_schedule.minute,0)
    }
    HourlyScheduleSnapshotsToKeep = {
      value = try(var.settings.hourly_schedule.snapshots_to_keep,0)
    }
    MonthlyScheduleHour = {
      value = try(var.settings.monthly_schedule.hour,0)
    }
    MonthlyScheduleMinute = {
      value = try(var.settings.monthly_schedule.minute,0)
    }
    MonthlyScheduleSnapshotsToKeep = {
      value = try(var.settings.monthly_schedule.snapshots_to_keep,0)
    }
    MonthlyScheduleDaysofMonth = {
      value = try(var.settings.monthly_schedule.days_of_month,0)
    }
    WeeklyScheduleHour = {
      value = try(var.settings.weekly_schedule.hour,0)
    }
    WeeklyScheduleMinute = {
      value = try(var.settings.weekly_schedule.minute,0)
    }
    WeeklyScheduleSnapshotsToKeep = {
      value = try(var.settings.weekly_schedule.snapshots_to_keep,0)
    }
    WeeklyScheduleDaysofWeek = {
      value = try(var.settings.weekly_schedule.days_of_week,0)
    }
    enabled = {
      value = try(var.settings.enabled,true)
    }
    resourceGroupName = {
      value = var.resource_group_name
    }
  }
}