# Каталог доменных событий — «Будущее 2.0»

## Домен: Медицина

| Событие | Семантика | Минимальный контракт |
|---------|-----------|---------------------|
| `PatientRegistered` | Зарегистрирован новый пациент | `{patientId, fullName, clinicId, registeredAt}` |
| `AppointmentScheduled` | Запланирован приём | `{appointmentId, patientId, doctorId, scheduledAt}` |
| `AppointmentCompleted` | Приём завершён | `{appointmentId, patientId, doctorId, completedAt, researchIds[]}` |
| `DiagnosisFinalized` | Диагноз поставлен | `{diagnosisId, patientId, icdCode, finalizedAt}` |

**Подписчики:**
- `PatientRegistered` → Аналитика, Финтех
- `AppointmentScheduled` → AI/ML, Управление
- `AppointmentCompleted` → AI/ML, Аналитика
- `DiagnosisFinalized` → Аналитика

---

## Домен: AI/ML

| Событие | Семантика | Минимальный контракт |
|---------|-----------|---------------------|
| `ResearchAICompleted` | AI завершил анализ исследования | `{predictionId, researchId, confidence, result, completedAt}` |

**Подписчики:**
- `ResearchAICompleted` → Медицина (уведомление врача)

---

## Домен: Финтех

| Событие | Семантика | Минимальный контракт |
|---------|-----------|---------------------|
| `AccountOpened` | Открыт новый счёт | `{accountId, customerId, accountType, openedAt}` |
| `CreditApplicationCreated` | Заявка на кредит | `{creditId, accountId, amount, term, createdAt}` |
| `CreditApproved` | Кредит одобрен | `{creditId, accountId, approvedAmount, approvedAt}` |
| `PaymentProcessed` | Платёж обработан | `{paymentId, accountId, amount, type, processedAt}` |

**Подписчики:**
- `AccountOpened` → Аналитика, Медицина
- `CreditApplicationCreated` → Аналитика
- `CreditApproved` → Аналитика
- `PaymentProcessed` → Аналитика, Медицина

---

## Домен: Управление

| Событие | Семантика | Минимальный контракт |
|---------|-----------|---------------------|
| `InventoryUpdated` | Обновление инвентаря | `{inventoryId, clinicId, itemType, quantity, updatedAt}` |
| `EmployeeAssigned` | Сотрудник назначен | `{employeeId, clinicId, role, assignedAt}` |

**Подписчики:**
- `InventoryUpdated` → Аналитика
- `EmployeeAssigned` → Медицина
