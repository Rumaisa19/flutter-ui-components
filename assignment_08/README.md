# UBIT Hub

A Flutter assignment project — a centralized campus application for university students featuring academic updates, a peer-to-peer marketplace, and profile management.

---

## Screens

| Screen              | Description                                         |
| ------------------- | --------------------------------------------------- |
| **Login**           | Email/password authentication with form validation  |
| **Dashboard**       | GPA summary, next class card, campus news feed      |
| **Marketplace**     | Filterable product grid with sell functionality     |
| **Profile**         | Tabbed profile portal with personal info management |
| **Drawer + Logout** | Side nav drawer with confirmed sign-out flow        |

---

## Project Structure

```
lib/
├── main.dart
├── core/
│   └── app_theme.dart           # ThemeData, color constants
├── models/
│   ├── product.dart
│   └── news_item.dart
├── data/
│   └── mock_data.dart           # Hardcoded lists for products, news, filters
├── widgets/
│   ├── product_card.dart        # Reusable card with Stack price badge
│   ├── news_widgets.dart        # FeaturedNewsCard + NewsListTile
│   └── profile_strength_card.dart
└── screens/
    ├── auth/
    │   └── login_screen.dart
    ├── home/
    │   └── home_screen.dart
    ├── marketplace/
    │   └── marketplace_screen.dart
    ├── profile/
    │   └── profile_screen.dart
    └── main_shell.dart          # BottomNavigationBar + Drawer host
```

---

## Technical Implementation

### State Management

- `StatefulWidget` used where UI reacts to user interaction
- `TextEditingController` and `TabController` initialized in `initState`, disposed in `dispose`
- No external state management package — vanilla Flutter as required by the assignment

### Screen 1 — Login

- `Form` widget with `GlobalKey<FormState>` for validation
- `TextFormField` for both inputs (not `TextField`)
- Email validated against regex pattern; password enforces minimum 6-character length
- Password visibility toggled via `obscureText` boolean in local state
- `CheckboxListTile` for Remember Me
- `ElevatedButton` triggers validation before navigation
- `TextButton` / `GestureDetector` for Forgot Password and Create Account links

### Screen 2 — Dashboard

- `SingleChildScrollView` wrapping full body content
- GPA and Next Class rendered as a `Row` of `Expanded` + decorated `Container` cards
- Featured news built as an extracted `FeaturedNewsCard` widget using `Stack` + `Positioned` badge over image
- Remaining news rendered via `NewsListTile` extracted widget
- `BottomNavigationBar` state managed in `MainShell`

### Screen 3 — Marketplace

- `Column` layout: static header + `Expanded` scrollable grid
- Filter chips rendered in a horizontal `ListView` with animated selection state
- `GridView.builder` with `SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)`
- `ProductCard` is an extracted `StatelessWidget` using `Stack` + `Positioned` for the price badge overlaid on the image
- `FloatingActionButton.extended` for the Sell Item action

### Screen 4 — Profile

- `TabController` with 3 tabs, initialized in `initState` with `SingleTickerProviderStateMixin`
- `TabBarView` wrapped in `Expanded`
- `DropdownButtonFormField` for department selection
- `RadioListTile` widgets for gender identification (Male / Female / Non-binary)
- `LinearProgressIndicator` inside a decorated container for profile strength
- Save action validates form via `GlobalKey<FormState>`

### Screen 5 — Drawer & Logout Dialog

- `Scaffold(drawer: Drawer(...))` with `DrawerHeader` and `ListTile` items
- Log Out tile triggers `showDialog` with a custom `AlertDialog`
- "No, stay" — `OutlinedButton`, dismisses dialog
- "Yes, sign out" — `ElevatedButton`, calls `Navigator.pushAndRemoveUntil` back to `LoginScreen`, clearing the entire back stack

---

## Getting Started

**Requirements:** Flutter SDK 3.x, Dart 3.x

```bash
# Clone or copy project folder
cd ubit_hub

# Install dependencies
flutter pub get

# Run on connected device or emulator
flutter run
```

---

## Assignment

**Course:** Mobile Application Development  
**Assignment:** 08 — UBIT Student Hub  
**Batch:** B24  
**Figma:** [Flutter Assignment 8 — UBIT B24](https://www.figma.com/design/Ev1meE99J0ZjGJTOBXNSwn/Flutter-Assignment-8---UBIT-B24?node-id=708-444&t=aWA6XZeaNaH8Rf5U-1)
