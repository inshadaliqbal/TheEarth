import 'package:flutter/material.dart';
import 'package:theearth/constants/style.dart';
import '../constants/constants.dart';


class MainButton extends StatelessWidget {
  final VoidCallback onPressed; // Callback function for button onPressed event
  final String? buttonTitle; // Title text for the button

  const MainButton({super.key, required this.onPressed, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: kMainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed, // Setting onPressed event to the provided callback function
        child: Text(buttonTitle!, style: kMainButtonTextStyle), // Displaying button title text with custom style
      ),
    );
  }
}
