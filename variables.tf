variable "environment" {
  type        = string
  description = "Prod or NonProd"
  validation {
    condition     = contains(["prod", "nonprod"], var.environment)
    error_message = "Valid values are prod or nonprod"
  }
  default = "nonprod"
}