variable "user_names" {
  description = "IAM users example."
  type        = list(any)
  default     = ["neo", "trinity", "morpheus"]
}