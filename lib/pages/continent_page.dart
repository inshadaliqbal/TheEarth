import 'package:flutter/material.dart';
import 'package:theearth/constants/constants.dart';
import 'package:theearth/constants/style.dart';
import '../widgets/extracted_widgets.dart';

class Continent extends StatelessWidget {
  static const String continentPage = 'continent_page';

  const Continent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: const Center(
          child: Text(
            'Explore the Continents',
            style: kContinentPageTitleTextStyle,
          ),
        ),
      ),
      body: Container(
        decoration: continentPageContainerBoxDecoration,
        padding: EdgeInsets.only(top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Select a ',
                    style: kMainPageCaptionTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kMainColor
                    ),
                    child: Text(
                      'Continent',
                      style: kMainPageCaptionContinentTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            ContinentCard(),
          ],
        ),
      ),
    );
  }
}
