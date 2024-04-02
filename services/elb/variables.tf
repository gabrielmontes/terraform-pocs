variable "name" {
  description = "ELB name"
  type        = string
}

variable "port" {
  description = "Server port."
  type        = number
}

variable "az" {
  description = "AZ - data source."
  type        = string
}

variable "security_group" {
  description = "SG id - module."
  type        = string
}