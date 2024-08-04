import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:theearth/constants/country_class.dart';
import 'package:theearth/pages/country_page.dart';
import '../helpers/networking.dart';

class LoadingScreen extends StatefulWidget {
  CountryData dataForCountryPage; // Data object for the country page
  LoadingScreen({required this.dataForCountryPage});
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var imageData; // Variable for storing image data

  void getLocationData() async {
    try {
      NetworkHelper networkHelper = await NetworkHelper(
          countryName: widget.dataForCountryPage.commonName); // Creating network helper object to fetch data
      imageData = await networkHelper.getData(); // Fetching image data from API
    } catch (e) {
      print('An error occurred while fetching image data: $e'); // Handling error if data fetching fails
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return CountryPage(
            countryData: widget.dataForCountryPage, // Passing country data to CountryPage
            imageData: imageData, // Passing image data to CountryPage
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getLocationData(); // Calling function to load data when the screen initializes
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitPulse(
        color: Colors.white,
        size: 80,
      ),
    );
  }
}
