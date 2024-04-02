variable "name" {
  description = "ASG name."
  type        = string
}

variable "instance_type" {
  description = "Instance type family."
  type        = string
  default     = "t2.micro"
}

variable "port" {
  description = "Server port."
  type        = number
  default     = 80
}

variable "min_size" {
  description = "Min amount of instances."
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Max amount of instances."
  type        = number
  default     = 2
}

variable "user_data" {
  description = "User data script path."
  type        = string
}

variable "ami" {
  description = "AMI id - data source."
  type        = string
}

variable "security_group" {
  description = "SG id - module."
  type        = string
}

variable "az" {
  description = "AZ - data source."
  type        = string
}

variable "lb" {
  description = "LB id - module."
  type        = string
}