terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "infrastructure" {
  filename = "${path.module}/provisioned-resource.txt"

  content = <<-EOT
    Infrastructure provisioned using Terraform.
    Project: CI/CD Automation Demo
    Status: Successfully provisioned
  EOT
}
