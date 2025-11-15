variable "rgs" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}

variable "network" {}
variable "public_ips" {}
variable "key_vault" {}
variable "vms" {}
variable "sql_servers" {}
variable "sql_database" {}
variable "stas" {}
