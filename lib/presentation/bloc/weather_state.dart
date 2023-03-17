part of 'weather_bloc.dart';

@immutable
class WeatherInitialState {}

class WeatherDataFetchState extends WeatherInitialState {
  final Weather weatherData;

  WeatherDataFetchState(this.weatherData);
}
