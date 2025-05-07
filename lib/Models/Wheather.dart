class Wheather {
  String cityName;
  String countryName;
  double temperature;
  String weatherCondition;
  String weatherConditionIcon;

  Wheather({
    required this.cityName,
    required this.countryName,
    required this.temperature,
    required this.weatherCondition,
    required this.weatherConditionIcon,
  });
  factory Wheather.fromJson(Map<String, dynamic> json) {
    return Wheather(
      cityName: json['location']['name'],
      countryName: json['location']['country'],
      temperature: json['current']['temp_c'],
      weatherCondition: json['current']['condition']['text'],
      weatherConditionIcon: json['current']['condition']['icon'],
    );
  }
}
