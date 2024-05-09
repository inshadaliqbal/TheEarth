import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:theearth/country_class.dart';
import 'package:theearth/country_page.dart';
import 'networking.dart';

class LoadingScreen extends StatefulWidget {
  CountryData dataForCountryPage;
  LoadingScreen({required this.dataForCountryPage});
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var imageData;
  void getLocationData() async {
    try {
      NetworkHelper networkHelper = await NetworkHelper(
          countryName: widget.dataForCountryPage.commonName);
      imageData = await networkHelper.getData();
    } catch (e) {
      print('An error occurred while fetching image data: $e');
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return CountryPage(
            countryData: widget.dataForCountryPage,
            imageData: imageData,
          );
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
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
