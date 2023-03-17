import 'package:geolocator/geolocator.dart';
import 'package:weathertracker/data/data_sources/weather_remote_data_source.dart';
import 'package:weathertracker/domain/entities/forecast.dart';
import 'package:weathertracker/domain/entities/weather.dart';

class WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepository({required this.remoteDataSource});

  Future<Weather> getCurrentWeather({required String city}) async {
    return await remoteDataSource.getCurrentWeather(city);
  }

  Future<Weather> getCurrentLocationWeather(
      {required Position position}) async {
    return await remoteDataSource.getCurrentWeatherByCoords(
        position.latitude, position.longitude);
  }

  Future<List<Forecast>> getFiveDayForecast({required String city}) async {
    return await remoteDataSource.getFiveDayForecast(city);
  }
}
