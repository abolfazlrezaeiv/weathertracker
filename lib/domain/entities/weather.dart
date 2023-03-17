class Weather {
  final String cityName;
  final String description;
  final double temperature;
  final double windSpeed;
  final int humidity;
  final String iconCode;

  Weather({
    required this.cityName,
    required this.description,
    required this.temperature,
    required this.windSpeed,
    required this.humidity,
    required this.iconCode,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0];
    final main = json['main'];
    final wind = json['wind'];
    return Weather(
      cityName: json['name'],
      description: weather['description'],
      temperature: main['temp'].toDouble(),
      windSpeed: wind['speed'].toDouble(),
      humidity: main['humidity'],
      iconCode: weather['icon'],
    );
  }
}
