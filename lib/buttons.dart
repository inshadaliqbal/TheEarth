import 'package:flutter/material.dart';
import 'continent_page.dart';
import 'constants.dart';

class MainButton extends StatelessWidget {
  Function buttonFunction;
  MainButton({required this.buttonFunction});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.tealAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Adjust the value as needed
        ),
      ),
      onPressed: () {
        buttonFunction();
      },

      // setState(() {
      // rotation = false;
      // });
      child: Text('Visit Earth', style: kMainButtonTextStyle),
    );
  }
}
