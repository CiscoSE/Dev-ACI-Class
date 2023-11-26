variable "epg1_name" {
  default = "demo-epg1"
}
variable "epg2_name" {
  default = "demo-epg2"
}

# Domain Name for Management
variable "manangement_domain" {
  default = "Management1"
}

# Domain Name for Storage
variable "storage_domain" {
  default = "Storage"
}

###################################################
# EPG 1
###################################################

resource "aci_application_epg" "epg1" {
  name                   = var.epg1_name
  relation_fv_rs_bd = aci_bridge_domain.bd1.id
  application_profile_dn = aci_application_profile.app1.id
}

data "aci_physical_domain" "management" {
  name = var.manangement_domain
}

resource "aci_epg_to_domain" "epg1-dom" {
  application_epg_dn = aci_application_epg.epg1.id
  tdn                = data.aci_physical_domain.management.id
  instr_imedcy       = "immediate"
  res_imedcy         = "immediate"
  #vmm_allow_promiscuous = "accept"
  #vmm_forged_transmits  = "accept"
  #vmm_mac_changes       = "accept"
}

###################################################
# EPG 2
###################################################

resource "aci_application_epg" "epg2" {
  name                   = var.epg2_name
  relation_fv_rs_bd = aci_bridge_domain.bd2.id
  application_profile_dn = aci_application_profile.app1.id
}

data "aci_physical_domain" "storage" {
  name = var.storage_domain
}

resource "aci_epg_to_domain" "epg2-dom" {
  application_epg_dn = aci_application_epg.epg2.id
  tdn                = data.aci_physical_domain.storage.id
  instr_imedcy       = "immediate"
  res_imedcy         = "immediate"
#  vmm_allow_promiscuous = "accept"
#  vmm_forged_transmits  = "accept"
#  vmm_mac_changes       = "accept"

}
