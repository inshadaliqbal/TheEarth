import 'package:flutter/material.dart';
import 'package:theearth/buttons.dart';
import 'networking.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class CountryPage extends StatefulWidget {
  static const String countryPage = 'country_page';
  String? officialName;
  Map<String, dynamic>? currencyUsed;
  List<dynamic>? capitalName;
  String? languageUsed;
  double? area;
  String? mapURL;
  String? commonName;
  int? population;
  String? continent;
  String? subContinent;
  String? flagURL;
  CountryPage(
      {required this.officialName,
      required this.currencyUsed,
      required this.capitalName,
      required this.languageUsed,
      required this.area,
      required this.mapURL,
      required this.commonName,
      required this.population,
      required this.continent,
      required this.subContinent,
      required this.flagURL});

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  var imageData;
  void getImageData() async {
    NetworkHelper networkHelper =
        await NetworkHelper(countryName: widget.commonName);
    imageData = await networkHelper.getData();
    print(imageData);
  }

  @override
  void initState() {
    // TODO: implement initState

    getImageData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(jsonDecode(imageData)["hits"]
                                [index]["largeImageURL"]),
                            fit: BoxFit.cover),
                        color: Colors.teal,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      width: 400,
                    );
                  },
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.commonName}',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2),
                        ),
                        Container(
                          height: 50,
                          width: 100,
                          padding: EdgeInsets.all(10),
                          child: Image(
                            image: NetworkImage(widget.flagURL!),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'About',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1),
                    ),
                    Container(
                      child: Flexible(
                        child: Text(
                          'Welcome to ${widget.officialName}, a vibrant nation nestled in ${widget.continent}, boasting a rich tapestry of cultures and languages, with ${widget.population} inhabitants and ${widget.languageUsed} as its common tongue. The bustling capital of ${widget.capitalName} serves as the pulsating epicenter of this diverse land, where historic landmarks blend seamlessly with modern marvels. Spanning ${widget.area} square kilometers, ${widget.officialName} showcases breathtaking natural landscapes, from lush forests to picturesque coastlines, beckoning adventurers and nature enthusiasts alike. With a thriving economy driven by the ${widget.currencyUsed}, ${widget.officialName} actively engages on the global stage, fostering diplomatic relations and addressing pressing issues. Immerse yourself in ${widget.officialName}\'s captivating allure, where every moment promises discovery and every experience leaves an indelible mark.',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                    Center(
                        child: MainButton(
                            buttonFunction: () async {
                              final Uri _url = Uri.parse('${widget.mapURL}');
                              if (!await launchUrl(_url)) {
                                throw Exception('Could not launch $_url');
                              }
                            },
                            buttonTitle: 'Locate ${widget.commonName}'))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
