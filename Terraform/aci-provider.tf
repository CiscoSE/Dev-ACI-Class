# Specify the Cisco ACI provider
terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
      version = "2.10.1"
    }
  }
}

# Use the provider to assigne credentials. We use these for everything going forward.
provider "aci" {
  # This is the user name in ACI (usually a local users)
  username = var.apic_auth.user_name
  password = var.password
  url      = "https://${var.apic_auth.apic}"
  insecure = true
}


# Takes a backup of the APIC. We do this here because we want it to happen before any other changes. 
#resource "aci_rest" "snapshot" {
#  path = "/api/mo/uni/fabric/configexp-terraform-${timestamp()}.json"
#  class_name = "configExportP"
#  content = {
#    snapshot = "yes"
#    adminSt = "triggered"
#  }
#}
