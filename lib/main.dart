import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theearth/pages/continent_page.dart';
import 'pages/main_page.dart';
import 'helpers/provider_engine.dart';

void main() {
  runApp(const TheEarth()); // Starting point of the application
}

class TheEarth extends StatelessWidget {
  const TheEarth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( // Using ChangeNotifierProvider for managing app state
      create: (context) {
        return MainEngine(); // Creating an instance of MainEngine for state management
      },
      child: MaterialApp( // MaterialApp widget for overall app structure
        debugShowCheckedModeBanner: false, // Disabling debug banner
        initialRoute: MainPage.mainPage, // Setting initial route to MainPage
        routes: {
          MainPage.mainPage: (context) => const MainPage(), // Defining route for MainPage
          Continent.continentPage: (context) => const Continent(), // Defining route for ContinentPage
        },
        home: const MainPage(), // Setting MainPage as the default home page
      ),
    );
  }
}
