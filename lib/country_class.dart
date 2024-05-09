class CountryData{
  String? officialName;
  Map<String, dynamic> currencyUsed;
  List? capitalName;
  Map? languageUsed;
  double? area;
  String? mapURL;
  String? commonName;
  int? population;
  String? continent;
  String? subContinent;
  bool? isExpandable;
  String? flagURL;
  CountryData({required this.officialName,required this.currencyUsed,required this.capitalName,required this.languageUsed,required this.area,required this.mapURL,required this.commonName,required this.population,required this.continent, required this.subContinent,required this.isExpandable,required this.flagURL});


  void changeExpandle(){
    isExpandable = !isExpandable!;
  }
}