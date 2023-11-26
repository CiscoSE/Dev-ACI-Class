variable apic_auth {
  type = object ({
      apic        = string
      user_name   = string
    })
}

variable password {
  default = ""
  description = "Password for the APIC"
}
