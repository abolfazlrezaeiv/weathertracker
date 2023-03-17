import 'dart:convert';

import 'package:weathertracker/domain/entities/weather.dart';
import 'package:weathertracker/infrastructure/http_client.dart';

class WeatherRemoteDataSource {
  final WeatherHttpClient _weatherHttpClient;

  WeatherRemoteDataSource(this._weatherHttpClient);

  Future<Weather> getCurrentWeather(String city) async {
    final response = await _weatherHttpClient.getCurrentWeatherData(city);
    final jsonResponse = json.decode(response.body);
    return Weather.fromJson(jsonResponse);
  }

  Future<List<Weather>> getFiveDayForecast(String city) async {
    final response = await _weatherHttpClient.getFiveDayForecast(city);
    final jsonResponse = json.decode(response.body);
    final List<dynamic> list = jsonResponse['list'];
    final weatherList = list.map((e) => Weather.fromJson(e)).toList();
    return weatherList;
  }

  Future<Weather> getCurrentWeatherByCoords(double lat, double lon) async {
    final response =
        await _weatherHttpClient.getCurrentWeatherDataByCoords(lat, lon);
    final jsonResponse = json.decode(response.body);
    return Weather.fromJson(jsonResponse);
  }
}
