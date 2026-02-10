# Event Storming — «Будущее 2.0»

## Диаграмма событий

### Обозначения
- **Command** (оранжевый) — действие пользователя или системы
- **Domain Event** (оранжевый) — факт, произошедший в системе
- **Policy / Read Model** (зелёный) — реакция на событие

---

### Домен: Медицина

```
RegisterPatient ──► PatientRegistered ──► Создать мед. карту
                                         Уведомить аналитику

ScheduleAppointment ──► AppointmentScheduled ──► Уведомить врача
                                                 Уведомить пациента

CompleteAppointment ──► AppointmentCompleted ──► Запустить AI-анализ

FinalizeDiagnosis ──► DiagnosisFinalized ──► Обновить мед. карту
                                             Отправить в аналитику
```

### Домен: AI/ML

```
RunAIAnalysis ──► ResearchAICompleted ──► Уведомить врача о результатах
```

### Домен: Финтех

```
OpenAccount ──► AccountOpened ──► Создать профиль в мед. системе

ApplyForCredit ──► CreditApplicationCreated ──► Провести скоринг

ApproveCredit ──► CreditApproved ──► Начислить средства на счёт

ProcessPayment ──► PaymentProcessed ──► Обновить баланс
                                        Отправить в аналитику
```

### Домен: Управление

```
UpdateInventory ──► InventoryUpdated ──► Обновить аналитику

AssignEmployee ──► EmployeeAssigned ──► Обновить расписание клиники
```

---

## Поток взаимодействия между доменами

```
Пациент регистрируется
    │
    ▼
[PatientRegistered] ─────────────► Аналитика: обновить дашборд
    │
    ▼
Врач создаёт приём
    │
    ▼
[AppointmentScheduled] ──────────► AI: подготовить модели
    │
    ▼
Приём завершён, исследования проведены
    │
    ▼
[AppointmentCompleted] ──────────► AI: запустить анализ
    │                               │
    │                               ▼
    │                         [ResearchAICompleted]
    │                               │
    │                               ▼
    │                         Врач получает результаты AI
    ▼
Врач ставит диагноз
    │
    ▼
[DiagnosisFinalized] ────────────► Аналитика: обновить статистику
```
