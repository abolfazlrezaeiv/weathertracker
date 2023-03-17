import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathertracker/data/repositories/weather_repository.dart';
import 'package:weathertracker/domain/entities/weather.dart';
import 'package:weathertracker/infrastructure/location.dart';
import 'package:weathertracker/infrastructure/shared_preferences.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherInitialState> {
  final WeatherRepository _repository;
  final SharedPreferencesHelper _sharedPreferencesHelper;
  WeatherBloc(this._repository, this._sharedPreferencesHelper)
      : super(WeatherInitialState()) {
    on<WeatherEvent>((event, emit) async {
      if (event is HomeScreenLoadedEvent) {
        var weatherData = await _repository.getCurrentWeather(city: '');
        emit(WeatherDataFetchState(weatherData));
      }

      if (event is CitySelectedEvent) {
        var weatherData = await _repository.getCurrentWeather(city: event.city);
        emit(WeatherDataFetchState(weatherData));
      }

      if (event is LocationButtonPressedEvent) {
        var location = await determinePosition();
        var weatherData =
            await _repository.getCurrentLocationWeather(position: location);
        emit(WeatherDataFetchState(weatherData));
      }

      if (event is AddCityToListEvent) {
        await _sharedPreferencesHelper.addCity(event.city);
      }
    });
  }
}
