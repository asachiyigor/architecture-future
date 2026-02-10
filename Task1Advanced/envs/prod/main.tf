terraform {
  required_version = ">= 1.5"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.90"
    }
  }
}

provider "yandex" {
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

module "vm" {
  source = "../../modules/vm"

  vm_name     = var.vm_name
  cores       = var.cores
  memory      = var.memory
  disk_size   = var.disk_size
  disk_type   = var.disk_type
  subnet_id   = var.subnet_id
  ssh_key     = var.ssh_key
  zone        = var.zone
  environment = var.environment
  labels      = var.labels
}

output "vm_id" {
  value = module.vm.vm_id
}

output "vm_ip" {
  value = module.vm.internal_ip
}

output "vm_external_ip" {
  value = module.vm.external_ip
}
