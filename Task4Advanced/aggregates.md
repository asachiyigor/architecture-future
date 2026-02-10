# Описание агрегатов — «Будущее 2.0»

## Домен: Медицина

### Агрегат: Patient
- **Границы**: ФИО, контактные данные, медицинская история (ссылки)
- **Инварианты**: ФИО обязательно, возраст > 0, уникальный PatientId
- **Ключи**: `PatientId` (UUID)
- **Атрибуты**: PersonalInfo (PII), MedicalHistory (список DiagnosisId), ClinicId

### Агрегат: Appointment
- **Границы**: Приём, расписание врача, статус
- **Инварианты**: один врач — одно время, статус Scheduled → InProgress → Completed | Cancelled (только вперёд)
- **Ключи**: `AppointmentId` (UUID)
- **Атрибуты**: PatientId, DoctorId, ScheduledAt, Status, ClinicId

### Агрегат: Diagnosis
- **Границы**: Диагноз, результаты исследований, AI-предсказание
- **Инварианты**: диагноз не изменяется после финализации, привязан к исследованию
- **Ключи**: `DiagnosisId` (UUID)
- **Атрибуты**: PatientId, DoctorId, ResearchResults[], AIPredictionId (optional), IcdCode, Status

---

## Домен: Финтех

### Агрегат: Account
- **Границы**: Счёт клиента, баланс, тип
- **Инварианты**: баланс >= 0 (кроме кредитной линии), уникальный AccountId
- **Ключи**: `AccountId` (UUID)
- **Атрибуты**: CustomerId, AccountType, Balance, Currency, Status

### Агрегат: Credit
- **Границы**: Кредитный договор, условия, статус
- **Инварианты**: одобрение требует скоринга, сумма > 0, ставка > 0
- **Ключи**: `CreditId` (UUID)
- **Атрибуты**: AccountId, Amount, InterestRate, Term, Status (Pending → Approved → Active → Closed | Defaulted)

### Агрегат: Payment
- **Границы**: Платёжная транзакция
- **Инварианты**: привязан к счёту, сумма > 0, идемпотентность (PaymentId)
- **Ключи**: `PaymentId` (UUID)
- **Атрибуты**: AccountId, Amount, Type, ProcessedAt, Status

---

## Домен: AI/ML

### Агрегат: Model
- **Границы**: ML-модель, версия, метрики качества
- **Инварианты**: модель проходит валидацию перед продакшеном
- **Ключи**: `ModelId` (UUID)
- **Атрибуты**: Name, Version, Metrics, Status (Draft → Validated → Production → Deprecated)

### Агрегат: Prediction
- **Границы**: Результат AI-анализа исследования
- **Инварианты**: привязан к Research, confidence 0..1
- **Ключи**: `PredictionId` (UUID)
- **Атрибуты**: ResearchId, ModelId, Confidence, Result, CompletedAt

---

## Домен: Аналитика

### Агрегат: DataProduct
- **Границы**: Данные как продукт (Data Mesh), SLA, владелец
- **Инварианты**: уникальное имя в каталоге, RBAC-доступ
- **Ключи**: `DataProductId` (UUID)
- **Атрибуты**: Name, Domain, Owner, Schema, SLA, AccessPolicy

---

## Домен: Управление

### Агрегат: Employee
- **Границы**: Сотрудник, роль, привязка к клинике
- **Инварианты**: сотрудник принадлежит одной клинике
- **Ключи**: `EmployeeId` (UUID)
- **Атрибуты**: FullName, Role, ClinicId, Department

### Агрегат: Inventory
- **Границы**: Инвентарь клиники
- **Инварианты**: количество >= 0, привязан к клинике
- **Ключи**: `InventoryId` (UUID)
- **Атрибуты**: ClinicId, ItemType, Quantity, LastUpdatedAt
