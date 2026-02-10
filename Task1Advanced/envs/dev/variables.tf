variable "cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
}

variable "folder_id" {
  description = "Yandex Cloud Folder ID"
  type        = string
}

variable "vm_name" {
  description = "Имя виртуальной машины"
  type        = string
}

variable "cores" {
  description = "Количество ядер CPU"
  type        = number
}

variable "memory" {
  description = "Объём RAM в ГБ"
  type        = number
}

variable "disk_size" {
  description = "Размер диска данных в ГБ"
  type        = number
}

variable "disk_type" {
  description = "Тип диска"
  type        = string
}

variable "subnet_id" {
  description = "ID подсети"
  type        = string
}

variable "ssh_key" {
  description = "Публичный SSH-ключ"
  type        = string
}

variable "zone" {
  description = "Зона доступности"
  type        = string
}

variable "environment" {
  description = "Окружение"
  type        = string
}

variable "labels" {
  description = "Метки ВМ"
  type        = map(string)
  default     = {}
}
