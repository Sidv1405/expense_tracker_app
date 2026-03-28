# 💰 Expense Tracker App

A robust personal finance management application built with **Flutter** following **Clean Architecture** principles. This project focuses on scalability, maintainability, and high performance using a reactive local database.

---

## 🏗 Architecture

The project follows the **Clean Architecture** pattern, divided into three core layers:

* **Data Layer:** Contains Repository implementations, DataSources (Drift Database), and DTO Models.
* **Domain Layer:** The central layer containing Business Logic, Entities, and Repository Interfaces.
* **Presentation Layer:** User Interface (UI), reusable Widgets, and State Management using **BLoC**.

---

## 🛠 Tech Stack

* **State Management:** [Flutter BLoC](https://pub.dev/packages/flutter_bloc)
* **Database:** [Drift](https://drift.simonbinder.eu/) (SQLite) - Type-safe & Reactive.
* **Dependency Injection:** [GetIt](https://pub.dev/packages/get_it) & [Injectable](https://pub.dev/packages/injectable).
* **Networking:** [Dio](https://pub.dev/packages/dio) & [Retrofit](https://pub.dev/packages/retrofit).
* **Version Management:** [FVM](https://fvm.app/) (Flutter Version Management).
* **Navigation:** [GoRouter](https://pub.dev/packages/go_router).

---

## 🚀 Setup & Installation

Since environment configurations and auto-generated files (`*.g.dart`) are ignored by Git to keep the codebase clean, you **must** follow these steps after cloning the repository:

### 1. Install FVM (If not already installed)
```bash
dart pub global activate fvm