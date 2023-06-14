terraform {
  required_version = ">= 0.13"
}

output "hello_world" {
  value = "Hello World!"
}

output "xc_namespace" {
  value = var.xc_namespace
}

output "owner" {
  value = var.owner
}

output "ssh_key" {
  value = var.ssh_key
}

output "trusted_ip" {
  value = var.trusted_ip
}

variable "xc_namespace" {
  type = string
  description = "F5 XC namespace. stripped from the email address"
}
variable "owner" {
  type = string
}
variable "ssh_key" {
  type = string
}
variable "trusted_ip" {
  type = string
}
