# keyvaults = {

#   kv_mgmt_l3 = {
#     name                            = "thcalz-mgmt-kvl3-01"
#     resource_group_key              = "thcalz_mgmt_test_rg"
#     sku_name                        = "premium"
#     soft_delete_enabled             = true
#     region                          = "thcuks"
#     purge_protection_enabled        = true
#     enabled_for_deployment          = true
#     enabled_for_disk_encryption     = true
#     enabled_for_template_deployment = true

#     tags = {


#       "ApplicationOwner" : "NA",
#       "Description" : "MGMT",
#       "SupportedBy" : "Wipro",
#       "BrandName" : "THC"
#       "Environment" : "MGMT",
#       "Application" : "NA",
#       "Customer" : "THC",
#       "CreationDate" : "NA"
#     }

#     creation_policies = {
#       logged_in_user = {
#         # if the key is set to "logged_in_user" add the user running terraform in the keyvault policy
#         # More examples in /examples/keyvault
#         certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Purge", "Recover", "GetIssuers", "SetIssuers", "ListIssuers", "DeleteIssuers", "ManageIssuers", "Restore", "ManageContacts"]
#         secret_permissions      = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
#       }
#     }
#   }
# }
