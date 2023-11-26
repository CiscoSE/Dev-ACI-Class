variable "tenant1_name" {
  default = "Student_Tenant2"
}

resource "aci_tenant" "tenant1" {
  name = var.tenant1_name
}

