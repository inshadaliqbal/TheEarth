import 'package:flutter/material.dart';
import 'package:theearth/constants/style.dart';
import 'package:theearth/widgets/buttons.dart';
import 'package:theearth/constants/constants.dart';
import 'package:theearth/constants/country_class.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class CountryPage extends StatelessWidget {
  final CountryData countryData; // Declaring country data object
  final String? imageData; // Declaring image data variable for country images
  static const String countryPage = 'country_page'; // Defining a constant string for the page route

  CountryPage({super.key, required this.imageData, required this.countryData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          jsonDecode(imageData!)["hits"][index]["largeImageURL"], // Decoding and fetching image URL from JSON data
                        ),
                        fit: BoxFit.cover,
                      ),
                      color: kMainColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    width: 400,
                  );
                },
                itemCount: 5, // Setting item count for ListView
                scrollDirection: Axis.horizontal, // Setting horizontal scroll direction for ListView
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '${countryData.commonName}', // Displaying country common name
                          style: kCountryPageTitleTextStyle,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 100,
                        padding: const EdgeInsets.all(10),
                        child: Image(
                          image: NetworkImage(countryData.flagURL!), // Displaying country flag image
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'About :-', // Text widget
                    style: kCountryPageAboutTextStyle,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: ListView(
                        children: [
                          Text(
                            'Welcome to ${countryData.officialName}, a vibrant nation nestled in ${countryData.continent}, boasting a rich tapestry of cultures and languages, with ${countryData.population} inhabitants and ${countryData.languageUsed?[countryData.languageUsed!.keys.first]} as its common tongue. The bustling capital of ${countryData.capitalName![0]} serves as the pulsating epicenter of this diverse land, where historic landmarks blend seamlessly with modern marvels. Spanning ${countryData.area} square kilometers, ${countryData.officialName} showcases breathtaking natural landscapes, from lush forests to picturesque coastlines, beckoning adventurers and nature enthusiasts alike. With a thriving economy driven by the ${countryData.currencyUsed[countryData.currencyUsed.keys.first]["name"]}, ${countryData.officialName} actively engages on the global stage, fostering diplomatic relations and addressing pressing issues. Immerse yourself in ${countryData.officialName}\'s captivating allure, where every moment promises discovery and every experience leaves an indelible mark.', // Displaying country information
                            style: kCountryPageDescTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  MainButton(
                    onPressed: () async {
                      final Uri _url = Uri.parse('${countryData.mapURL}'); // Parsing map URL
                      if (!await launchUrl(_url)) { // Launching URL
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Failed to launch map URL'), // Showing snackbar if failed to launch URL
                          ),
                        );
                      }
                    },
                    buttonTitle: 'Locate ${countryData.commonName}', // Button title
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
