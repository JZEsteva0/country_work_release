class CountryModel {
  final String name;
  final String flag;
  final String region;
  final String map;
  final int population;


  CountryModel({
    required this.name,
    required this.flag,
    required this.region,
    required this.map,
    required this.population,

  });

  factory CountryModel.fromJson(Map<String, dynamic> json){
    return CountryModel(
      name: json['name']['common'],
      flag: json['flags']["png"],
      region: json['region'],
      map: json['maps']['googleMaps'],
      population:json ['population'],
      );

  }
}