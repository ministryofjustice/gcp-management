variable "folder" {
  type = string
}

variable "billing_account" {
  type = string
}

variable "name" {
  type = string
}

variable "project_id" {
  type = string
}

variable "labels" {
  type    = map(string)
  default = {}
}

variable "environment" {
  type = string
}
