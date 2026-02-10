output "vm_id" {
  description = "ID виртуальной машины"
  value       = yandex_compute_instance.vm.id
}

output "vm_name" {
  description = "Имя виртуальной машины"
  value       = yandex_compute_instance.vm.name
}

output "internal_ip" {
  description = "Внутренний IP-адрес ВМ"
  value       = yandex_compute_instance.vm.network_interface[0].ip_address
}

output "external_ip" {
  description = "Внешний IP-адрес ВМ (если назначен)"
  value       = try(yandex_compute_instance.vm.network_interface[0].nat_ip_address, null)
}

output "boot_disk_id" {
  description = "ID загрузочного диска"
  value       = yandex_compute_disk.boot_disk.id
}

output "data_disk_id" {
  description = "ID диска данных"
  value       = yandex_compute_disk.data_disk.id
}

output "fqdn" {
  description = "FQDN виртуальной машины"
  value       = yandex_compute_instance.vm.fqdn
}
