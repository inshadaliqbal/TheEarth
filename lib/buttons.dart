import 'package:flutter/material.dart';
import 'package:theearth/style.dart';
import 'constants.dart';

class MainButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? buttonTitle;

  const MainButton({super.key, required this.onPressed, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: kMainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Adjust the value as needed
        ),
      ),
      onPressed: onPressed,
      child: Text(buttonTitle!, style: kMainButtonTextStyle),
    );
  }
}
