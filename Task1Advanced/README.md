# Task 1 Advanced — Модульная инфраструктура для нескольких сред

## Описание

Универсальный модуль Terraform для развёртывания виртуальных машин в Yandex Cloud. Модуль параметризован и поддерживает несколько окружений (dev, stage, prod) через отдельные `.tfvars` файлы.

## Структура

```
Task1Advanced/
├── modules/
│   └── vm/
│       ├── main.tf          # Ресурсы: ВМ + диски + сеть
│       ├── variables.tf      # Входные параметры модуля
│       └── outputs.tf        # Выходные значения (ID, IP, FQDN)
├── envs/
│   ├── dev/
│   │   ├── main.tf          # Вызов модуля для dev
│   │   ├── variables.tf     # Переменные окружения
│   │   └── dev.tfvars       # Конфигурация dev (2 CPU, 4 GB RAM)
│   ├── stage/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── stage.tfvars     # Конфигурация stage (4 CPU, 8 GB RAM)
│   └── prod/
│       ├── main.tf
│       ├── variables.tf
│       └── prod.tfvars      # Конфигурация prod (8 CPU, 16 GB RAM)
└── README.md
```

## Параметры модуля

| Параметр | Тип | По умолчанию | Описание |
|----------|-----|-------------|---------|
| `vm_name` | string | — | Имя виртуальной машины |
| `cores` | number | 2 | Количество ядер CPU |
| `memory` | number | 4 | Объём RAM в ГБ |
| `disk_size` | number | 50 | Размер диска данных в ГБ |
| `disk_type` | string | network-ssd | Тип диска |
| `subnet_id` | string | — | ID подсети |
| `ssh_key` | string | — | Публичный SSH-ключ |
| `environment` | string | — | Окружение (dev/stage/prod) |
| `zone` | string | ru-central1-a | Зона доступности |
| `labels` | map(string) | {} | Метки ВМ |

## Выходные значения

| Выход | Описание |
|-------|---------|
| `vm_id` | ID виртуальной машины |
| `vm_name` | Имя ВМ |
| `internal_ip` | Внутренний IP-адрес |
| `external_ip` | Внешний IP (если назначен) |
| `boot_disk_id` | ID загрузочного диска |
| `data_disk_id` | ID диска данных |
| `fqdn` | FQDN виртуальной машины |

## Как запустить

```bash
# Dev
cd envs/dev
terraform init
terraform plan -var-file=dev.tfvars
terraform apply -var-file=dev.tfvars

# Stage
cd ../stage
terraform init
terraform plan -var-file=stage.tfvars
terraform apply -var-file=stage.tfvars

# Prod
cd ../prod
terraform init
terraform plan -var-file=prod.tfvars
terraform apply -var-file=prod.tfvars
```

## Конфигурации окружений

| Параметр | Dev | Stage | Prod |
|----------|-----|-------|------|
| CPU | 2 | 4 | 8 |
| RAM | 4 GB | 8 GB | 16 GB |
| Диск | 30 GB HDD | 80 GB SSD | 200 GB SSD |
| Зона | ru-central1-a | ru-central1-b | ru-central1-c |
| NAT | Да | Да | Нет |
