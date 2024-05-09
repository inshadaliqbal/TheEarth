import 'package:http/http.dart' as http;

import 'package:connectivity_plus/connectivity_plus.dart';
class NetworkHelper {
  String? countryName;
  NetworkHelper({required this.countryName});

  Future<dynamic> getData() async {


    final ConnectivityResult connectivityResult =
    await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print('internet problem');
    } else {
      http.Response response = await http.get(
        Uri.parse("https://pixabay.com/api/?key=19287678-50757094ceb179404cc63406d&q=${countryName}"),
      );
      if (response.statusCode == 200) {
        var data = response.body;
        return data;
      } else {
        print(response.statusCode);
      }
    }
  }
}
