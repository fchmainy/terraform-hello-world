terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">3.8.0"
    }
  }  
}

output "hello_world" {
  value = "Hello World!"
}

output "xc_namespace" {
  value = var.namespace
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

output "nginx_repo_crt" {
  value = "${base64decode(var.nginx_repo_cert)}"
}

output "nginx_repo_key" {
  value = "${base64decode(var.nginx_repo_key)}"
}

output "bigip" {
  value = data.aws_ami.f5_ami.id
}

variable "namespace" {
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
variable "nginx_repo_cert" {
  type = string
}
variable "nginx_repo_key" {
  type = string
}

data "aws_ami" "f5_ami" {
  most_recent = true
  owners      = ["679593333241"]

  filter {
    name   = "description"
    values = ["F5 BIGIP-16* PAYG-Best 200Mbps*"]
  }
}
