import 'package:flutter/material.dart';

const kMainColor = Colors.tealAccent;

InputDecoration textFieldInputDecoration = InputDecoration(
  hintText: 'Search Country',
  hintStyle:
  const TextStyle(color: Colors.black),
  contentPadding: const EdgeInsets.symmetric(
      vertical: 15.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius:
    BorderRadius.circular(30.0),
    borderSide: const BorderSide(
      color: Colors.teal,
      width: 2.0,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius:
    BorderRadius.circular(30.0),
    borderSide: const BorderSide(
      color: Colors.teal,
      width: 2.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius:
    BorderRadius.circular(30.0),
    borderSide: const BorderSide(
      color: Colors.teal,
      width: 2.0,
    ),
  ),
  suffixIcon: const Icon(
    Icons.search,
    color: Colors.teal,
    size: 30,
  ),
);

BoxDecoration mainPageContainerBoxDecoration = const BoxDecoration(
  image: DecorationImage(image: AssetImage('images/bg.jpg'), fit: BoxFit.fill),
);

BoxDecoration continentPageContainerBoxDecoration = const BoxDecoration(
  image: DecorationImage(image: AssetImage('images/bg.jpg'), fit: BoxFit.fill),
);

BoxDecoration continentCardBoxDecoration =BoxDecoration(
  borderRadius: BorderRadius.circular(200),
  color: Colors.black.withOpacity(0.5),);

BoxDecoration bottomSheetTitleDecoration = BoxDecoration(
    borderRadius:
    BorderRadius.circular(20),
    color: Colors.teal);