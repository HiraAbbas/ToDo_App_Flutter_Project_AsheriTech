import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  // final TextEditingController componentController = TextEditingController();
  final String hintText;
  final TextEditingController controller;

 const  CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
        ),
      ),
    );
  }
}
