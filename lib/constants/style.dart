import 'package:flutter/material.dart';

const kMainColor = Color(0xFF02EFC2);

InputDecoration textFieldInputDecoration = InputDecoration(
  hintText: 'Search Country',
  hintStyle:
  const TextStyle(color: Colors.white),
  contentPadding: const EdgeInsets.symmetric(
      vertical: 15.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius:
    BorderRadius.circular(30.0),
    borderSide: const BorderSide(
      color: kMainColor,
      width: 2.0,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius:
    BorderRadius.circular(30.0),
    borderSide: const BorderSide(
      color: kMainColor,
      width: 2.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius:
    BorderRadius.circular(30.0),
    borderSide: const BorderSide(
      color: kMainColor,
      width: 2.0,
    ),
  ),
  suffixIcon: const Icon(
    Icons.search,
    color: kMainColor,
    size: 30,
  ),
);

BoxDecoration popUpContainerDecoration = BoxDecoration(
    color: const Color(0xFF135D66),
    borderRadius: BorderRadius.circular(10));

BoxDecoration mainPageContainerBoxDecoration = const BoxDecoration(
  image: DecorationImage(image: AssetImage('images/bg.jpg'), fit: BoxFit.fill),
);

BoxDecoration continentPageContainerBoxDecoration = const BoxDecoration(
  image: DecorationImage(image: AssetImage('images/bg.jpg'), fit: BoxFit.fill),
);

BoxDecoration continentCardBoxDecoration =BoxDecoration(
  borderRadius: BorderRadius.circular(150),
  color: Color(0xFF171A28).withOpacity(0.8),
  border: Border.all(width: 0.1,color: Colors.white)

);

BoxDecoration bottomSheetTitleDecoration = BoxDecoration(
    borderRadius:
    BorderRadius.circular(20),
    color: kMainColor);