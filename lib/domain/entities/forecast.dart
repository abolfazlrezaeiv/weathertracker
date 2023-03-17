class Forecast {
  double temperature;

  Forecast({required this.temperature});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      temperature: json['main']['temp'].toDouble(),
    );
  }
}
