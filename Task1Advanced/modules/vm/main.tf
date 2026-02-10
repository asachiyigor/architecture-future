terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.90"
    }
  }
}

# ─── Загрузочный диск ───
resource "yandex_compute_disk" "boot_disk" {
  name     = "${var.vm_name}-boot-disk"
  zone     = var.zone
  image_id = var.image_id
  size     = 10
  type     = var.disk_type

  labels = merge(var.labels, {
    environment = var.environment
    managed_by  = "terraform"
  })
}

# ─── Дополнительный диск (данные) ───
resource "yandex_compute_disk" "data_disk" {
  name = "${var.vm_name}-data-disk"
  zone = var.zone
  size = var.disk_size
  type = var.disk_type

  labels = merge(var.labels, {
    environment = var.environment
    managed_by  = "terraform"
  })
}

# ─── Виртуальная машина ───
resource "yandex_compute_instance" "vm" {
  name        = var.vm_name
  platform_id = var.platform_id
  zone        = var.zone

  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot_disk.id
  }

  secondary_disk {
    disk_id     = yandex_compute_disk.data_disk.id
    auto_delete = false
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = var.environment != "prod" ? true : false
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_key}"
  }

  labels = merge(var.labels, {
    environment = var.environment
    managed_by  = "terraform"
  })
}
