# stock





---

# 📈 Stock Portfolio App – Flutter

A Flutter-based stock portfolio management application built using **MVC architecture**, **BLoC (Cubit) state management**, and **AutoRoute navigation**. The application integrates real-time stock data using the Alpha Vantage API.

---

## 🚀 Features

* 🔎 Search stocks using SYMBOL_SEARCH API
* 📊 View historical daily stock data (TIME_SERIES_DAILY)
* 💰 Add stocks with investment amount
* 📈 Track total portfolio value on Dashboard
* 🔄 Reactive UI updates using Cubit state management
* 🧭 Type-safe navigation with AutoRoute

---

## 🏗 Architecture

* **MVC Pattern**

  * Model → API response models
  * View → Screens & reusable widgets
  * Controller → Cubits & business logic

* **State Management**: flutter_bloc (Cubit)

* **Routing**: AutoRoute

* **API Integration**: Alpha Vantage

---

## 📂 Project Structure

```
lib/
├── controller/
│   ├── cubits/
│   ├── states/
│   ├── router/
│   └── constants/
├── model/response_models/
├── view/
│   ├── screens/
│   └── common_widgets/
└── main.dart
```

---

## 🔌 APIs Used

* SYMBOL_SEARCH
* TIME_SERIES_DAILY

Data fetched from Alpha Vantage and rendered dynamically using Cubit state transitions.

---

## 🛠 Tech Stack

* Flutter
* flutter_bloc
* auto_route
* REST API integration

---

This project demonstrates structured architecture, clean state management, API handling, and scalable navigation suitable for production-level Flutter applications.
