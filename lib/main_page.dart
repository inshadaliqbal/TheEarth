import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theearth/constants.dart';
import 'package:theearth/provider_engine.dart';
import 'style.dart';
import 'buttons.dart';
import 'continent_page.dart';

class MainPage extends StatefulWidget {
  static const String mainPage = 'welcome_screen';
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool rotation = true;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<MainEngine>(context).getAPIData();
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: mainPageContaineBoxDecoration,
          padding: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text('THE EARTH', style: kMainPageHeadingTextStyle),
                ),
                Center(
                  child: Text('Solar System 70% N2',
                      style: kMainPageCaptionTextstyle),
                ),
                Expanded(
                  child: Container(
                      // color: Colors.white38,
                      // child: InteractiveGlobe(isRotate: rotation,),
                      ),
                ),
                MainButton(
                  buttonFunction: () {
                    Navigator.pushNamed(context, Continent.continentPage);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
