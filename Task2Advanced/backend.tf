terraform {
  required_version = ">= 1.5"

  backend "s3" {
    # S3-совместимое хранилище (MinIO / Yandex Object Storage)
    endpoint = "https://storage.yandexcloud.net"
    bucket   = "future2-terraform-state"
    key      = "infrastructure/terraform.tfstate"
    region   = "ru-central1"

    # Для Yandex Object Storage
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true

    # Блокировка состояния через DynamoDB-совместимую таблицу
    dynamodb_table = "terraform-locks"
  }
}
