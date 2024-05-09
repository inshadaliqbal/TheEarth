import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theearth/pages/continent_page.dart';
import 'pages/main_page.dart';
import 'helpers/provider_engine.dart';

void main() {
  runApp(const TheEarth());
}

class TheEarth extends StatelessWidget {
  const TheEarth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return MainEngine();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: MainPage.mainPage,
        routes: {
          MainPage.mainPage: (context) => const MainPage(),
          Continent.continentPage: (context) => const Continent(),
        },
        home: const MainPage(),
      ),
    );
  }
}
