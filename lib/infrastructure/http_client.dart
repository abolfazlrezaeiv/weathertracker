import 'package:http/http.dart' as http;

class WeatherHttpClient {
  static const _baseUrl = 'https://api.openweathermap.org/data/2.5';

  final String _apiKey = 'ffdbf39c2b553cea272d978ba5dc47a8';

  Future<http.Response> getCurrentWeatherData(String city) async {
    final url = '$_baseUrl/weather?q=$city&appid=$_apiKey&units=imperial';
    final response = await http.get(Uri.parse(url));
    return response;
  }

  Future<http.Response> getFiveDayForecast(String city) async {
    final url = '$_baseUrl/forecast?q=$city&appid=$_apiKey&units=imperial';
    final response = await http.get(Uri.parse(url));
    return response;
  }

  Future<http.Response> getCurrentWeatherDataByCoords(
      double lat, double lon) async {
    final url =
        '$_baseUrl/weather?lat=$lat&lon=$lon&appid=$_apiKey&units=imperial';
    final response = await http.get(Uri.parse(url));
    return response;
  }
}
