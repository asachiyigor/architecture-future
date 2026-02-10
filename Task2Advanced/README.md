# Task 2 Advanced — CI/CD и удалённое хранение состояния

## Описание

Автоматизация развёртывания инфраструктуры через GitHub Actions с удалённым хранением Terraform state в S3-совместимом хранилище (Yandex Object Storage).

## Структура

```
Task2Advanced/
├── backend.tf              # S3 backend для remote state
├── main.tf                 # Основная конфигурация + provider
├── variables.tf            # Переменные (включая sensitive)
├── outputs.tf              # Выходные значения
├── .github/
│   └── workflows/
│       └── terraform.yml   # CI/CD pipeline
└── README.md
```

## CI/CD Pipeline

Pipeline состоит из трёх jobs:

1. **Plan** — `terraform init` → `validate` → `plan` (на каждый PR и push)
2. **Apply** — `terraform apply` (только main + ручное подтверждение через GitHub Environment)
3. **Security** — `tfsec` сканирование безопасности конфигурации

## Настройка секретов GitHub

| Secret | Описание |
|--------|---------|
| `YC_TOKEN` | OAuth-токен Yandex Cloud |
| `YC_CLOUD_ID` | ID облака |
| `YC_FOLDER_ID` | ID каталога |
| `S3_ACCESS_KEY` | Access key для Object Storage |
| `S3_SECRET_KEY` | Secret key для Object Storage |

## Remote State

- **Backend**: S3-совместимый (Yandex Object Storage)
- **Bucket**: `future2-terraform-state`
- **Блокировка**: DynamoDB-совместимая таблица `terraform-locks`
- **State не хранится локально и не коммитится в git**
