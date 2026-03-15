# 💰 Finance Tracker

Мобильное приложение для учета доходов и расходов, написанное на **Flutter**.

---

## 🛠 Технологический стек

Проект спроектирован с упором на надежность, реактивность и чистый код:

* **State Management:** [BLoC / Cubit] 
* **Database:** [Drift] 
* **DI:** [Get_it]
* **Navigation:** [GoRouter]

---

## 🏗 Архитектура проекта

Приложение следует принципу **Feature-first Layered Architecture**. Весь код разделен на независимые модули (фичи), что упрощает поддержку и масштабирование.

### Структура папок:

```text
lib/
├── app/                        # Инициализация и глобальная конфигурация
│   ├── app.dart                # Корневой виджет приложения
│   ├── database/               # Описание схем Drift и миграции
│   ├── di/                     # Настройка GetIt (Dependency Injection)
│   └── router/                 # Конфигурация GoRouter (маршруты)
├── core/                       # Общие ресурсы (Shared)
│   ├── themes/                 # Цвета (colors.dart), размеры, стили текста
│   ├── utils/                  # Полезные утилиты (LoadingOverlay, SnackBar)
│   └── widgets/                # Переиспользуемые UI компоненты (UI Kit)
├── features/                   # Функциональные модули
│   └── [feature_name]/         # Например: transactions, categories, stats
│       ├── data/               # Репозитории (Impl) и Drift DAO
│       ├── domain/             # Модели (Entities) и контракты репозиториев
│       └── presentation/       # UI (Screens) и логика (Bloc/Cubit)
└── main.dart                   # Точка входа в приложение