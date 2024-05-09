import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theearth/continent_page.dart';
import 'package:theearth/country_page.dart';
import 'main_page.dart';
import 'provider_engine.dart';
import 'myapp.dart';

void main(){
  runApp(TheEarth(),);
}

class TheEarth extends StatelessWidget {
  const TheEarth({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context){
        return MainEngine();
      },
      child: MaterialApp(
        initialRoute: MainPage.mainPage,
        routes: {
          MainPage.mainPage:(context)=> MainPage(),
          Continent.continentPage: (context) => Continent(),
        },
        home: MainPage(),
      ),
    );
  }
}
