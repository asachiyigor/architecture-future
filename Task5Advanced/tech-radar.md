# Расширенный технический радар — «Будущее 2.0»

## Техники и паттерны

| Технология / Паттерн | Кольцо | Обоснование |
|----------------------|--------|-------------|
| Data Mesh | Trial | Ключевой подход для трансформации данных, пилот в 1-2 доменах |
| Event-Driven Architecture | Adopt | Основа интеграции доменов, заменяет Camel |
| Domain-Driven Design | Adopt | Стандарт моделирования для всех новых доменов |
| Infrastructure as Code | Adopt | Terraform для всей инфраструктуры |
| Privacy by Design | Adopt | Обязательно для медицинских и финансовых данных (152-ФЗ) |
| Event Sourcing | Trial | Для критических доменов (финтех, мед. карты) |
| CQRS | Trial | Разделение чтения/записи для аналитики |
| Self-service BI | Trial | Портал самообслуживания для бизнес-пользователей |
| CI/CD (GitOps) | Adopt | Автоматизация деплоя через GitHub Actions |
| FinOps | Assess | Контроль облачных затрат |
| Batch ETL | Hold | Заменяется на streaming, сохраняется только для legacy |

## Платформы

| Технология | Кольцо | Обоснование |
|-----------|--------|-------------|
| Apache Kafka | Adopt | Центральная шина событий между доменами |
| Yandex Cloud | Adopt | Основной облачный провайдер (152-ФЗ, рус. поддержка) |
| Kubernetes (K8s) | Adopt | Оркестрация контейнеров для всех сервисов |
| Apache Iceberg | Trial | Формат таблиц для Data Lakehouse |
| Apache Airflow | Trial | Оркестрация пайплайнов данных |
| DataHub | Trial | Data Catalog и Data Lineage |
| MinIO | Trial | S3-совместимое объектное хранилище |
| Nessie | Assess | Git-like версионирование данных |
| SQL Server 2008 | Hold | Legacy DWH, плановый вывод через 18 мес. |
| Apache Camel | Hold | Legacy ESB, замена на Kafka + ACL |
| PowerBuilder | Hold | Legacy UI, замена на React/Superset |

## Инструменты

| Технология | Кольцо | Обоснование |
|-----------|--------|-------------|
| Terraform | Adopt | IaC для всех окружений |
| Dremio | Trial | SQL-движок для Data Lakehouse |
| Apache Superset | Trial | BI-инструмент для портала самообслуживания |
| Prometheus + Grafana | Adopt | Мониторинг и алертинг |
| Keycloak | Adopt | SSO и IAM |
| Confluent Schema Registry | Trial | Контроль контрактов событий |
| Debezium | Trial | CDC для миграции данных из DWH |
| Power BI | Hold | Замена на Superset + Dremio |
| tfsec | Adopt | Сканирование безопасности Terraform |

## Языки и фреймворки

| Технология | Кольцо | Обоснование |
|-----------|--------|-------------|
| Java / Spring Boot | Adopt | Основной язык для медицинских сервисов |
| Golang | Adopt | Финтех-сервисы (высокая производительность) |
| Python / FastAPI | Adopt | AI/ML сервисы, пайплайны данных |
| React | Trial | Фронтенд для портала самообслуживания |
| HCL (Terraform) | Adopt | Язык описания инфраструктуры |
