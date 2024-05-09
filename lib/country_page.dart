import 'package:flutter/material.dart';
import 'package:theearth/buttons.dart';
import 'package:theearth/constants.dart';
import 'package:theearth/country_class.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class CountryPage extends StatelessWidget {
  final CountryData? countryData;
  final String? imageData;
  static const String countryPage = 'country_page';

  CountryPage({super.key, required this.imageData, required this.countryData});

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
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            jsonDecode(imageData!)["hits"][index]["largeImageURL"],
                          ),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.teal,
                        borderRadius: const BorderRadius.only(
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
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${countryData!.commonName}',
                          style: kCountryPageTitleTextStyle,
                        ),
                        Container(
                          height: 50,
                          width: 100,
                          padding: const EdgeInsets.all(10),
                          child: Image(
                            image: NetworkImage(countryData!.flagURL!),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'About',
                      style: kCountryPageAboutTextStyle,
                    ),
                    Container(
                      child: Flexible(
                        child: Text(
                          'Welcome to ${countryData!.officialName}, a vibrant nation nestled in ${countryData!.continent}, boasting a rich tapestry of cultures and languages, with ${countryData!.population} inhabitants and ${countryData!.languageUsed} as its common tongue. The bustling capital of ${countryData!.capitalName} serves as the pulsating epicenter of this diverse land, where historic landmarks blend seamlessly with modern marvels. Spanning ${countryData!.area} square kilometers, ${countryData!.officialName} showcases breathtaking natural landscapes, from lush forests to picturesque coastlines, beckoning adventurers and nature enthusiasts alike. With a thriving economy driven by the ${countryData!.currencyUsed}, ${countryData!.officialName} actively engages on the global stage, fostering diplomatic relations and addressing pressing issues. Immerse yourself in ${countryData!.officialName}\'s captivating allure, where every moment promises discovery and every experience leaves an indelible mark.',
                          style: kCountryPageDescTextStyle,
                        ),
                      ),
                    ),
                    Center(
                      child: MainButton(
                        onPressed: () async {
                          final Uri _url = Uri.parse('${countryData!.mapURL}');
                          if (!await launchUrl(_url)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Failed to launch map URL'),
                              ),
                            );
                          }
                        },
                        buttonTitle: 'Locate ${countryData!.commonName}',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
