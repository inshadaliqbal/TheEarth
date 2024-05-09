import 'package:flutter/material.dart';
import 'package:theearth/constants.dart';
import 'package:theearth/style.dart';
import 'extracted_widgets.dart';

class Continent extends StatelessWidget {
  static const String continentPage = 'continent_page';
  const Continent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.tealAccent.shade700,
        elevation: 0.0,
        title: Center(
          child: Text(
            'Explore the Continents',
            style: kContinentPageTitle
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: continentPageContainerBoxDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Text(
                  'Select a Continent',
                  style: kMainPageCaptionTextstyle,
                  textAlign: TextAlign.center,
                ),
              ),
              ContinentCard()
            ],
          ),
        ),
      ),
    );
  }
}

