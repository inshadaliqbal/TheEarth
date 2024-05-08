import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';

class MainEngine extends ChangeNotifier {
  final List<String> _continentList = [
    'Asia',
    'Europe',
    'North America',
    'South America',
    'Antarctica',
    'Africa',
    'Australia'
  ];

  Map<String, List<Map>> _continentsMap = {
    'Asia': [],
    'Europe': [],
    'North America': [],
    'South America': [],
    'Antarctica': [],
    'Africa': [],
    'Australia': []
  };

  Map<String, String> _continentDescriptions = {
    'Africa': 'Africa, the second-largest continent, is renowned for its diverse landscapes, ranging from vast deserts like the Sahara to lush rainforests and savannas teeming with wildlife. It boasts a rich cultural tapestry, with thousands of languages spoken and vibrant traditions celebrated across its 54 countries.',
    'Asia': 'Asia, the largest continent, is a melting pot of cultures, landscapes, and histories. From the towering peaks of the Himalayas to the bustling metropolises of Tokyo and Mumbai, Asia offers a rich tapestry of experiences. It\'s home to ancient civilizations, modern economic powerhouses, and stunning natural wonders.',
    'Europe': 'Europe, the birthplace of Western civilization, is known for its picturesque landscapes, historic cities, and diverse cultures. From the romantic canals of Venice to the majestic castles of Scotland, Europe offers a wealth of architectural and natural beauty. Its rich history, art, and cuisine attract millions of visitors each year.',
    'North America': 'North America, comprising Canada, the United States, Mexico, and several smaller nations, is a land of contrasts. From the Arctic tundra to the tropical beaches of the Caribbean, it offers diverse landscapes and ecosystems. Its vibrant cities, technological innovation, and cultural diversity make it a dynamic region.',
    'South America': 'South America, with its dense rainforests, towering mountains, and pristine beaches, is a continent of natural wonders. From the Amazon rainforest to the Andes Mountains, it offers unparalleled biodiversity and breathtaking scenery. Its rich cultural heritage, including ancient civilizations like the Incas, adds to its allure.',
    'Australia': 'Oceania, comprising Australia, New Zealand, and thousands of Pacific islands, is a region of stunning natural beauty and cultural diversity. From the Great Barrier Reef to the volcanic landscapes of New Zealand, it offers unparalleled opportunities for adventure and exploration. Its indigenous cultures and traditions add depth and richness to the region.',
    'Antarctica': 'Antarctica, the southernmost continent, is a vast, icy wilderness that remains largely uninhabited. It is known for its stunning landscapes, including towering icebergs, vast glaciers, and pristine wilderness. Despite its harsh conditions, Antarctica supports a rich ecosystem of marine life, including whales, seals, and penguins.'
  };


  Future<dynamic> getAPIData() async {
    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    print(connectivityResult);
    if (connectivityResult == ConnectivityResult.none) {
      print('internet problem');
    } else {
      http.Response response = await http.get(
        Uri.parse('https://restcountries.com/v3.1/all'),
      );
      if(response.statusCode == 200){
        jsonDecode(response.body)[0]["region"];
        for (String continent in _continentList) {
          for (Map data in jsonDecode(response.body)) {
            if (continent == data["continents"][0]) {
              _continentsMap[continent]!.add(data);
            }
          }
        }
      }else{
        print('Api problem');
      }
    }
  }


  int get continentCount{
    return _continentList.length;
  }

  String? continentName(int index){
    return _continentList[index];
  }

  String? continentDiscription(String? choosenContinent){
    return _continentDescriptions[choosenContinent];
  }
}