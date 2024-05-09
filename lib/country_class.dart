class CountryData{
  String? officialName;
  String? commonName;
  int? population;
  String? continent;
  String? subContinent;
  bool? isExpandable;
  String? flagURL;
  CountryData({required this.officialName,required this.commonName,required this.population,required this.continent, required this.subContinent,required this.isExpandable,required this.flagURL});


  void changeExpandle(){
    isExpandable = !isExpandable!;
  }
}