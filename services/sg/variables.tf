variable "name" {
  description = "Security group name."
  type        = string
}

variable "from_port" {
  description = "Ingress from_port access."
  type        = number
}

variable "to_port" {
  description = "Ingress to_port access."
  type        = number
}

variable "protocol" {
  description = "Ingress protocol."
  type        = string
  default     = "tcp"
}

variable "cidr_block" {
  description = "Ingress public cidr_block."
  type        = string
  default     = "0.0.0.0/0"
}