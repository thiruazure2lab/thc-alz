resource_groups = {
  rg1 = {
    name = "Demo-RG"
    identity_goverance = true ### flag that alerts terraform to invoke identity module
    azuread_groups = {
      name = "SG-Demo"
      parent_group = "" ##### name of the parent SG
    }
    access_package = {
      package1={
        catalogId=""
        primaryApproverId  = ""
        secondaryApproverGroupId = ""
      }
    }
    tags ={}
  }
}