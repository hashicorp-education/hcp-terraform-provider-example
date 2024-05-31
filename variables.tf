variable "admin_group" {
  description = "The name of the the group creating the project"
  type        = string
}

variable "project_name" {
  description = "Name of the project to create"
  type        = string
  default     = "provider-example"
}

variable "group_name" {
  description = "The name of the project group to create"
  type        = string
  default     = "provider-example-group"
}

# AWS Access
variable "aws_key_id" {
  description = "AWS Key ID"
  type        = string
  default     = "fake key"
}

variable "aws_secret" {
  description = "AWS Secret Access Key"
  type        = string
  default     = "fake secret"
  sensitive   = true
}