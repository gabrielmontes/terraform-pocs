variable "name" {
  description = "Instance name."
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "AMI id - data source."
  type        = string
}

variable "port" {
  description = "Instance port access."
  type        = number
  default     = 8080
}

variable "instance_type" {
  description = "Instance type family."
  type        = string
  default     = "t2.micro"
}

variable "security_group_id" {
  description = "Instance type family."
  type        = string
}

variable "user_data" {
  description = "User data script path."
  type        = string
}