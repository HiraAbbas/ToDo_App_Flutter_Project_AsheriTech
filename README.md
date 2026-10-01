# 📝 Todo UI App (Student Manager)

A simple Flutter app to **add, view, edit and delete students** (name + father's name).
Built as a practice project to learn Flutter fundamentals: widgets, state management with `setState`, navigation, passing data between screens, and reusable components.

---

## ✨ Features

- 📋 View a list of students (ID, Name, Father Name) with a live count
- ➕ Add a new student on a separate screen
- ✏️ Edit an existing student (fields pre-filled)
- 🗑️ Delete a student from the list
- ✅ Snackbar feedback on validation error / successful update
- 🧩 Reusable custom widgets (`CustomButton`, `CustomTextField`)

---

## 📁 Project Structure

```
lib/
├── main.dart                  # App entry point (MaterialApp)
└── views/
    ├── first_screen.dart      # frontPage  – student list, add/edit/delete logic
    ├── second_screen.dart     # SecondScreen – add student form
    ├── third_screen.dart      # editPage – edit student form
    ├── model_class.dart       # Student model
    ├── custom_button.dart     # Reusable button widget
    └── custom_textfield.dart  # Reusable text field widget
```

| File | Purpose |
|------|---------|
| `main.dart` | Runs the app, sets `frontPage` as home, hides the debug banner |
| `first_screen.dart` | Holds the `students` list (the single source of truth) and all CRUD functions |
| `second_screen.dart` | Takes input and returns a new `Student` using `Navigator.pop` |
| `third_screen.dart` | Receives a `Student`, pre-fills fields, returns the updated `Student` |
| `model_class.dart` | `Student` class with auto-generated random ID |
| `custom_button.dart` | Styled `ElevatedButton` with icon + text |
| `custom_textfield.dart` | Styled `TextField` with rounded borders |

---

## 🔄 App Flow

```
                ┌───────────────┐
                │   frontPage   │  (list of students)
                └───────┬───────┘
        FAB (+) │               │ Edit icon
                ▼               ▼
        ┌─────────────┐   ┌─────────────┐
        │ SecondScreen│   │  editPage   │
        │  (Add form) │   │ (Edit form) │
        └──────┬──────┘   └──────┬──────┘
               │ pop(newStudent) │ pop(updatedStudent)
               ▼                 ▼
         students.add()    students[index] = result
                └───── setState() → UI refresh ─────┘
```

---

## 🧠 What I Learned (Concepts Covered)

### 1. Widgets & Layout
- `StatelessWidget` vs `StatefulWidget`
- `Scaffold`, `AppBar`, `FloatingActionButton`
- `Container` (width, padding, margin, `BoxDecoration`, border, `borderRadius`, `boxShadow`)
- `Column`, `Row`, `Expanded`, `SizedBox`
- `crossAxisAlignment`, `mainAxisAlignment`, `mainAxisSize`
- `Column(spacing: ...)` for gaps between children
- `Text` with `TextStyle`, `Icon`, `IconButton`
- Circular buttons using `BoxDecoration(shape: BoxShape.circle)`

### 2. Lists
- `ListView.builder` with `itemCount` and `itemBuilder` (efficient, builds only visible items)
- Extracting UI into a helper method: `Widget listviewComponent()`
- Showing dynamic data using string interpolation: `'Name: ${student.name}'`

### 3. State Management (`setState`)
- `setState(() { ... })` rebuilds the UI after data changes
- Keeping data in the `State` class (`final List<Student> students`)

### 4. List Operations
- `students.add(item)` – add
- `students.removeAt(index)` – delete by index
- `students.indexWhere((s) => s.id == id)` – find item by condition (used for editing by ID)
- Two ways to edit: by **index** (commented version) and by **`indexWhere` + ID** (current version – safer)

### 5. Navigation & Passing Data
- `Navigator.push(context, MaterialPageRoute(builder: ...))` – go to a new screen
- `Navigator.pop(context, value)` – go back **and return data**
- `await Navigator.push(...)` – wait for the result from the next screen
- Passing data **forward** through the constructor: `editPage(editModel: student)`

### 6. Async Programming
- `async` / `await` and `Future`
- `Future.delayed(Duration(seconds: 3))` – delay before navigating back
- `mounted` check (`if (!mounted) return;`) before using `context` after an `await`

### 7. Forms & Input
- `TextEditingController` to read/set text field values
- Pre-filling fields in `initState()` using `widget.editModel`
- Basic validation with `isNotEmpty`
- `ScaffoldMessenger.of(context).showSnackBar(SnackBar(...))` with `behavior: floating`, `duration`, `backgroundColor`

### 8. Dart Language Concepts
- Classes & constructors, `required` named parameters
- Optional/nullable types (`int?`, `List<String>?`)
- **Initializer list**: `id = id ?? Random().nextInt(1000)` – auto-generate ID if not provided
- **Named vs positional arguments**: `removeStudents({required int index})` vs `removeStudents(int index)`
- `const` constructors and `super.key`
- `final` fields
- Importing packages: `dart:math`, `package:flutter/material.dart`

### 9. Reusable Components
- Creating `CustomButton` (text, icon, onPressed callback) and `CustomTextField` (hint, controller)
- Passing functions as parameters: `final Function()? onPressed`
- Styling with `ElevatedButton.styleFrom` (size, colors, shape)
- `InputDecoration` with `OutlineInputBorder` and `focusedBorder`

### 10. Clean Code Practices
- Splitting the app into files/screens inside a `views` folder
- Model class separated from UI
- Keeping alternative approaches as comments for learning

---

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.x or later; `Column.spacing` and `withValues` need a recent version)
- Android Studio / VS Code with the Flutter extension
- An emulator or a physical device

### Run the project

```bash
# 1. Clone the repo
git clone <your-repo-url>
cd todo_ui_app

# 2. Install dependencies
flutter pub get

# 3. Run
flutter run
```

---

## 🧩 Code Highlights

**Student model with auto ID**
```dart
class Student {
  int id;
  String name;
  String fatherName;
  List<String>? subjects;

  Student({int? id, required this.name, required this.fatherName, this.subjects})
      : id = id ?? Random().nextInt(1000);
}
```

**Getting data back from another screen**
```dart
final result = await Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondScreen()),
);
setState(() => students.add(result));
```

**Updating by ID**
```dart
int foundIndex = students.indexWhere((student) => student.id == result.id);
setState(() => students[foundIndex] = result);
```

---


## 🗺️ Learning Roadmap

1. ✅ Widgets & layouts
2. ✅ `setState` and lists
3. ✅ Navigation and passing data
4. ✅ Forms, controllers, snackbars
5. ✅ Reusable widgets
6. ⬜ Form validation (`Form` + `TextFormField`)
7. ⬜ Local storage
8. ⬜ State management (Provider/Riverpod)
9. ⬜ API integration (`http`/`dio`)
10. ⬜ Firebase / backend

---

## 📸 Screenshots


| Home | Add | Edit |
|------|-----|------|
| ![home](screenshots/home.png) | ![add](screenshots/add.png) | ![edit](screenshots/edit.png) |

---

## 👩‍💻 Author

Made with HIRA ABBAS💙 while learning Flutter.

---

## 📄 License

This project is for learning purposes. Feel free to use and modify it.
