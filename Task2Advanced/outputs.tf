output "vm_id" {
  description = "ID виртуальной машины"
  value       = module.vm.vm_id
}

output "vm_ip" {
  description = "Внутренний IP-адрес ВМ"
  value       = module.vm.internal_ip
}

output "vm_external_ip" {
  description = "Внешний IP-адрес ВМ"
  value       = module.vm.external_ip
}
