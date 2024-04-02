variable "name" {
  description = "Name of the S3 bucket."
  type        = string
  default     = "gmontes-poc-bucket"
}

variable "acl_type" {
  description = "Private/Public"
  type        = string
  default     = "private"
}
