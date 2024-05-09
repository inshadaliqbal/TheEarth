import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkHelper {
  String? countryName; // Variable to store the country name
  NetworkHelper(
      {required this.countryName}); // Constructor to initialize the country name

  Future<dynamic> getData() async {
    final ConnectivityResult connectivityResult = await (Connectivity()
        .checkConnectivity()); // Check network connectivity
    if (connectivityResult == ConnectivityResult.none) {
      // If no internet connection
      print('Internet problem'); // Print message indicating internet problem
    } else {
      // If internet connection is available
      http.Response response = await http.get(
        // Make a GET request to the Pixabay API
        Uri.parse(
            "https://pixabay.com/api/?key=19287678-50757094ceb179404cc63406d&q=${countryName}"), // API endpoint with country name query parameter
      );
      if (response.statusCode == 200) {
        // If the request is successful
        var data = response.body; // Extract response body
        return data; // Return the data
      } else {
        // If the request fails
        print(response.statusCode); // Print the status code
      }
    }
  }
}
