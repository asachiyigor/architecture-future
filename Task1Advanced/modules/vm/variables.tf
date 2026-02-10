variable "vm_name" {
  description = "Имя виртуальной машины"
  type        = string
}

variable "cores" {
  description = "Количество ядер CPU"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Объём RAM в ГБ"
  type        = number
  default     = 4
}

variable "disk_size" {
  description = "Размер подключаемого диска в ГБ"
  type        = number
  default     = 50
}

variable "disk_type" {
  description = "Тип диска (network-ssd, network-hdd)"
  type        = string
  default     = "network-ssd"
}

variable "subnet_id" {
  description = "ID подсети для размещения ВМ"
  type        = string
}

variable "ssh_key" {
  description = "Публичный SSH-ключ для доступа к ВМ"
  type        = string
}

variable "image_id" {
  description = "ID образа ОС"
  type        = string
  default     = "fd8vmcue7aajpmeo39kk" # Ubuntu 22.04 LTS
}

variable "platform_id" {
  description = "Платформа для ВМ"
  type        = string
  default     = "standard-v3"
}

variable "zone" {
  description = "Зона доступности"
  type        = string
  default     = "ru-central1-a"
}

variable "environment" {
  description = "Окружение (dev, stage, prod)"
  type        = string
}

variable "labels" {
  description = "Метки для ВМ"
  type        = map(string)
  default     = {}
}
