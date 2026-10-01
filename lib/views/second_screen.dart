import 'package:flutter/material.dart';
import 'package:todo_ui_app/views/custom_button.dart';
import 'package:todo_ui_app/views/custom_textfield.dart';
import 'package:todo_ui_app/views/model_class.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();

  void saveStudent() {
    String name = nameController.text;
    String fatherName = fatherNameController.text;
    if (name.isNotEmpty || fatherName.isNotEmpty) {
      // All fields are filled, proceed with saving.
      final newStudent = Student(name: name, fatherName: fatherName);

      Navigator.pop(context, newStudent);
    } else {
      // Show an error message or handle the empty fields
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in both fields.'),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 5),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          spacing: 50,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(hintText: "Enter name", controller: nameController),
            CustomTextField(
              hintText: "Enter father's name",
              controller: fatherNameController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onPressed: saveStudent,
                  buttonText: "Add",
                  buttonIcon: Icons.add,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
