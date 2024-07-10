custom_landing_zones = {
 ######################### ALZ Root #####################################
  alz = {
    display_name               = "ALZ"
    parent_management_group_id = ""
    subscription_ids           = []
    archetype_config = {
      archetype_id   = "thcalz_root"
      parameters     = {}
      access_control = {}
    }
  }
  // #####################################################################
  // ######################  Parent Group  ###############################
  platform = {
     display_name               = "Platform"
     parent_management_group_id = "alz"
     subscription_ids           = []
     archetype_config = {
       archetype_id   = "platform"
       parameters     = {}
       access_control = {}
     }
   }

  landingzones = {
     display_name               = "LandingZones"
     parent_management_group_id = "alz"
     subscription_ids           = []
     archetype_config = {
       archetype_id   = "landingzones"
       parameters     = {}
       access_control = {}
     }
   }

  decommissioned = {
     display_name               = "Decommissioned"
     parent_management_group_id = "alz"
     subscription_ids           = []
     archetype_config = {
       archetype_id   = "thc_decommissioned"
       parameters     = {}
       access_control = {}
     }
   }

  sandbox = {
     display_name               = "Sandbox"
     parent_management_group_id = "alz"
     subscription_ids           = []
     archetype_config = {
       archetype_id   = "thc_sandboxes"
       parameters     = {}
       access_control = {}
     }
   }
#######################################################################
// ######################  Child Group  ###############################

 identity = {
     display_name               = "Identity"
     parent_management_group_id = "platform"
     subscription_ids           = ["ad3976ec-1742-428b-99ba-0cad14609749"]
     archetype_config = {
       archetype_id   = "platform_identity"
       parameters     = {}
       access_control = {}
     }
   }

 management = {
     display_name               = "Management"
     parent_management_group_id = "platform"
     subscription_ids           = ["9ca00828-7313-4d1a-8e50-8befc39eeb6f"]
     archetype_config = {
       archetype_id   = "platform_management"
       parameters     = {}
       access_control = {}
     }
   }
 
 connectivity = {
     display_name               = "Connectivity"
     parent_management_group_id = "platform"
     subscription_ids           = ["9adecef0-c958-4e2c-bd95-9c372d083c61"]
     archetype_config = {
       archetype_id   = "platform_connectivity"
       parameters     = {}
       access_control = {}
     }
   }

 corp = {
     display_name               = "Corp"
     parent_management_group_id = "landingzones"
     subscription_ids           = ["e9358d30-8961-4f78-93d4-46ee1e225e7b"]
     archetype_config = {
       archetype_id   = "landingzones_corp"
       parameters     = {}
       access_control = {}
     }
   }

 online = {
     display_name               = "Online"
     parent_management_group_id = "landingzones"
     subscription_ids           = []
     archetype_config = {
       archetype_id   = "default_empty"
       parameters     = {}
       access_control = {}
     }
   }


  // demo-americas-hub = {
  //   display_name               = "Demo-MG-Americas-HUB"
  //   parent_management_group_id = "demo-americas"
  //   subscription_ids           = []
  //   archetype_config = {
  //     archetype_id   = "default_empty"
  //     parameters     = {}
  //     access_control = {}
  //   }
  // }
  // demo-americas-mgmt = {
  //   display_name               = "Demo-MG-Americas-Mgmt"
  //   parent_management_group_id = "demo-americas"
  //   subscription_ids           = []
  //   archetype_config = {
  //     archetype_id   = "default_empty"
  //     parameters     = {}
  //     access_control = {}
  //   }
  // }
  // demo-americas-prd = {
  //   display_name               = "Demo-MG-Americas-PRD"
  //   parent_management_group_id = "demo-americas"
  //   subscription_ids           = []
  //   archetype_config = {
  //     archetype_id   = "demo_americas_customer"
  //     parameters     = {}
  //     access_control = {}
  //   }
  // }
  // demo-americas-nonprd = {
  //   display_name               = "Demo-MG-Americas-NONPRD"
  //   parent_management_group_id = "demo-americas"
  //   subscription_ids           = []
  //   archetype_config = {
  //     archetype_id   = "demo_americas_customer"
  //     parameters     = {}
  //     access_control = {}
  //   }
  // }
}