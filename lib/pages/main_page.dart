import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theearth/constants/constants.dart';
import 'package:theearth/helpers/provider_engine.dart';
import '../constants/style.dart';
import '../widgets/buttons.dart';
import 'continent_page.dart';
import '../widgets/imported_widget.dart';

class MainPage extends StatefulWidget {
  static const String mainPage = 'welcome_screen'; // Defining a constant string for the main page route

  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool rotation = true; // Boolean variable for rotation

  @override
  void initState() {
    super.initState();
    Provider.of<MainEngine>(context, listen: false).getAPIData(); // Initializing state and fetching API data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: mainPageContainerBoxDecoration,
        padding: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.only(top: 100, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: Text('THE EARTH', style: kMainPageHeadingTextStyle),
              ),
              const Center(
                child:
                Text('Solar System - 78% N2', style: kMainPageCaptionTextStyle),
              ),
              Expanded(
                child: InteractiveGlobe(isRotate: rotation),
              ),
              MainButton(
                buttonTitle: 'Visit Earth',
                onPressed: () {
                  Navigator.pop(context); // Popping the current route
                  Navigator.pushNamed(context, Continent.continentPage); // Navigating to the continent page
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
