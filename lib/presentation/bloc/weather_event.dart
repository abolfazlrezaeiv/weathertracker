part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class HomeScreenLoadedEvent extends WeatherEvent {}

class CitySelectedEvent extends WeatherEvent {
  final String city;

  CitySelectedEvent(this.city);
}

class LocationButtonPressedEvent extends WeatherEvent {}

class AddCityToListEvent extends WeatherEvent {
  final String city;

  AddCityToListEvent(this.city);
}
