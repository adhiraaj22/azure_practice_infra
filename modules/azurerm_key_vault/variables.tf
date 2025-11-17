variable "key_vault" {
  type = map(object({
    kv_name  = string
    location = string
    rg_name  = string
  }))
}
