part of 'weather_bloc.dart';

@immutable
class WeatherInitialState {}

class WeatherDataFetchState extends WeatherInitialState {
  final Weather weatherData;
  final List<String> cities;

  WeatherDataFetchState({required this.weatherData, required this.cities});
}
