import 'package:flutter/material.dart';
import 'package:theearth/constants/style.dart';
import '../constants/constants.dart';

class MainButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? buttonTitle;

  const MainButton({super.key, required this.onPressed, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: kMainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Adjust the value as needed
          ),
        ),
        onPressed: onPressed,
        child: Text(buttonTitle!, style: kMainButtonTextStyle),
      ),
    );
  }
}
