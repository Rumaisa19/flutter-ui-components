# Assignment 9 — Product Catalog Manager

> Flutter • Provider • REST API (CRUD) • HTTP

A fully functional **Product Catalog Manager** built with Flutter. Products are stored on a live REST API ([crudcrud.com](https://crudcrud.com)) and all app state is managed with the **Provider** package using clean architecture principles.

---

## Screenshots

<table>
  <tr>
    <td align="center"><b>Splash</b></td>
    <td align="center"><b>Empty State</b></td>
    <td align="center"><b>Product List</b></td>
  </tr>
  <tr>
    <td><img src="screenshots/1. splash screen.jpeg" width="220"/></td>
    <td><img src="screenshots/2. empty state.jpeg" width="220"/></td>
    <td><img src="screenshots/4. home screen.jpeg" width="220"/></td>
  </tr>
  <tr>
    <td align="center"><b>Add Product</b></td>
    <td align="center"><b>Edit Product</b></td>
    <td></td>
  </tr>
  <tr>
    <td><img src="screenshots/3. add product.jpeg" width="220"/></td>
    <td><img src="screenshots/5. edit product.jpeg" width="220"/></td>
    <td></td>
  </tr>
</table>

---

## Features

- Splash screen with staggered animations
- Fetch all products via **GET** on app launch
- Add new products via **POST**
- Edit existing products via **PUT**
- Delete products with confirmation dialog via **DELETE**
- Animated shimmer skeleton loading state
- Empty state with illustration
- Error state with retry button
- Pull-to-refresh on product list
- SnackBar feedback on every CRUD operation
- Clean separation of concerns — Model / Service / Provider / View

---

## Tech Stack

| Layer            | Tool                        |
| ---------------- | --------------------------- |
| UI               | Flutter (Material 3)        |
| State Management | Provider 6 + ChangeNotifier |
| Networking       | http package                |
| Backend          | crudcrud.com (REST API)     |

---

## Folder Structure

```
lib/
├── main.dart                          # App entry + MultiProvider setup
├── core/
│   ├── constants/
│   │   └── api_constants.dart         # Base URL, endpoints
│   └── theme/
│       └── app_theme.dart             # Colors, text styles, button themes
├── models/
│   └── product.dart                   # Product class + fromJson / toJson
├── services/
│   └── product_service.dart           # All HTTP calls (GET POST PUT DELETE)
├── providers/
│   └── product_provider.dart          # ChangeNotifier — state + service calls
└── views/
    ├── splash_screen.dart
    ├── home/
    │   ├── home_screen.dart
    │   └── widgets/
    │       ├── product_card.dart
    │       ├── loading_state.dart
    │       └── empty_state.dart
    └── product_form/
        └── product_form_screen.dart   # Shared Add / Edit screen
```

---

## Getting Started

### 1. Clone the repo

```bash
git clone https://github.com/Rumaisa19/flutter-ui-components.git
cd flutter-ui-components/assignment_09
```

### 2. Get dependencies

```bash
flutter pub get
```

### 3. Set your crudcrud API key

Open `lib/core/constants/api_constants.dart` and replace the ID:

```dart
static const String baseUrl =
    'https://crudcrud.com/api/YOUR_UNIQUE_ID';
```

Get a free token at [crudcrud.com](https://crudcrud.com) — no signup needed.

> ⚠️ The token resets every 24 hours and allows 100 requests. Update this file when it expires.

### 4. Run the app

```bash
flutter run
```

---

## Dependencies

```yaml
provider: ^6.1.2
http: ^1.2.1
```

---

## Provider API Usage

| API                  | Used When                                        |
| -------------------- | ------------------------------------------------ |
| `context.read<T>()`  | Calling a method — never inside `build()`        |
| `context.watch<T>()` | Reading state inside `build()`                   |
| `Consumer<T>`        | Scoped subtree rebuild without rebuilding parent |

---

## Assignment Info

| Field      | Detail                              |
| ---------- | ----------------------------------- |
| Course     | Flutter Development — UBIT Batch 26 |
| Assignment | 9 — Product Catalog Manager         |
| Topic      | Provider + HTTP (CRUD)              |
| Marks      | 100 pts                             |
