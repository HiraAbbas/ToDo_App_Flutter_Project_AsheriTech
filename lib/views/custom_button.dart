import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
  final IconData? buttonIcon;
  final Color? buttonColor;

  const CustomButton({
    super.key,
    this.onPressed,
    required this.buttonText,
    this.buttonIcon,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(180, 50),
        // 1. Set the background color
        backgroundColor: Colors.blueGrey,
        // Set text/icon color (Optional)
        foregroundColor: Colors.white,

        // 2. Set the border radius
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0), // Adjust radius value here
        ),
      ),
      child: Row(
        children: [
          Icon(buttonIcon, color: Colors.white, size: 25),
          Text(buttonText),
        ],
      ),

      // style: Text("add"),
    );
  }
}
