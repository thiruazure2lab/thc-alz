module "virtual_machine_autonumbering"{
    for_each = try(var.vm_name_config,{}) != {}?toset(["update"]):toset([])
    source  = "git::https://dev.azure.com/HighlandCouncil/AzureLandingZone/_git/CAF-Terraform_modules//modules/autonumbering/virtual_machine"

    depends_on = [
      module.solution
    ]

    virtual_machines            = var.virtual_machines
    vm_name_config              = var.vm_name_config
    autonumber_storage_config   = var.autonumber_storage_config
}