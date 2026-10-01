import 'package:flutter/material.dart';
import 'package:todo_ui_app/views/custom_button.dart';
import 'package:todo_ui_app/views/custom_textfield.dart';
import 'package:todo_ui_app/views/model_class.dart';

class editPage extends StatefulWidget {
  final Student editModel; // for student id
  const editPage({super.key, required this.editModel});

  @override
  State<editPage> createState() => _editPageState();
}

class _editPageState extends State<editPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();

  //----------only for practise purpose------------------//
  //--------adding asynchronous function to show.........................//
  //-----------snackbar and then back the screen after 3 seconds delay ----------------//
  void afterEditSaveStudent() async {
    String name = nameController.text;
    String fatherName = fatherNameController.text;

    final newStudent = Student(
      id: widget.editModel.id,
      name: name,
      fatherName: fatherName,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Fields updated successfully'),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    Navigator.pop(context, newStudent);
  }

  //-------without snackbar function------------------//

  // void afterEditSaveStudent() {
  //   String name = nameController.text;
  //   String fatherName = fatherNameController.text;

  //   final newStudent = Student(
  //     id: widget.editModel.id,
  //     name: name,
  //     fatherName: fatherName,
  //   );
  //   Navigator.pop(context, newStudent);
  // }
  @override
  void initState() {
    super.initState();
    nameController.text = widget.editModel.name;

    fatherNameController.text = widget.editModel.fatherName;
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
                  onPressed: afterEditSaveStudent,
                  buttonText: "Update",
                  buttonIcon: Icons.update,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
