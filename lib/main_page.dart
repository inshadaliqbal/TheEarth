import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theearth/constants.dart';
import 'package:theearth/provider_engine.dart';
import 'style.dart';
import 'buttons.dart';
import 'continent_page.dart';
import 'imported_widget.dart';

class MainPage extends StatefulWidget {
  static const String mainPage = 'welcome_screen';

  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool rotation = true;

  @override
  void initState() {
    super.initState();
    Provider.of<MainEngine>(context, listen: false).getAPIData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: mainPageContainerBoxDecoration,
          padding: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: Text('THE EARTH', style: kMainPageHeadingTextStyle),
                ),
                const Center(
                  child:
                  Text('Solar System 70% N2', style: kMainPageCaptionTextStyle),
                ),
                Expanded(
                  child: Container(
                    // child: InteractiveGlobe(isRotate: rotation),
                  ),
                ),
                MainButton(
                  buttonTitle: 'Visit Earth',
                  onPressed: () {
                    setState(() {
                      rotation = false;
                    });
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
