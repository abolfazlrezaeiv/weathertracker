import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathertracker/data/repositories/weather_repository.dart';
import 'package:weathertracker/domain/entities/forecast.dart';
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
      await initialLoadingHandler(event, emit);

      await citySelectHandler(event, emit);

      await locationButtonPressHandler(event, emit);

      await saveCityHandler(event, emit);
    });
  }

  Future<void> saveCityHandler(
      WeatherEvent event, Emitter<WeatherInitialState> emit) async {
    if (event is AddCityToListEvent) {
      var weatherData = await _repository.getCurrentWeather(city: event.city);
      var forecast = await _repository.getFiveDayForecast(city: event.city);
      await _sharedPreferencesHelper.addCity(event.city);
      var cities = await _sharedPreferencesHelper.getCities();

      emit(WeatherDataFetchState(
          weatherData: weatherData, cities: cities, weatherForecast: forecast));
    }
  }

  Future<void> locationButtonPressHandler(
      WeatherEvent event, Emitter<WeatherInitialState> emit) async {
    if (event is LocationButtonPressedEvent) {
      var location = await determinePosition();
      var weatherData =
          await _repository.getCurrentLocationWeather(position: location);

      var cities = await _sharedPreferencesHelper.getCities();
      emit(WeatherDataFetchState(
          weatherData: weatherData, cities: cities, weatherForecast: const []));
    }
  }

  Future<void> citySelectHandler(
      WeatherEvent event, Emitter<WeatherInitialState> emit) async {
    if (event is CitySelectedEvent) {
      var weatherData = await _repository.getCurrentWeather(city: event.city);
      var forecast = await _repository.getFiveDayForecast(city: event.city);

      var cities = await _sharedPreferencesHelper.getCities();
      emit(WeatherDataFetchState(
          weatherData: weatherData, cities: cities, weatherForecast: forecast));
    }
  }

  Future<void> initialLoadingHandler(
      WeatherEvent event, Emitter<WeatherInitialState> emit) async {
    if (event is HomeScreenLoadedEvent) {
      var weatherData =
          await _repository.getCurrentWeather(city: 'Kuala Lumpur');
      var forecast = await _repository.getFiveDayForecast(city: 'Kuala Lumpur');
      await _sharedPreferencesHelper.addCity('Kuala Lumpur');
      await _sharedPreferencesHelper.addCity('George Town');
      await _sharedPreferencesHelper.addCity('Johor Bahru');
      var cities = await _sharedPreferencesHelper.getCities();
      emit(WeatherDataFetchState(
          weatherData: weatherData, cities: cities, weatherForecast: forecast));
    }
  }
}
