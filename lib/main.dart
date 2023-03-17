import 'package:flutter/material.dart';
import 'package:weathertracker/data/data_sources/weather_remote_data_source.dart';
import 'package:weathertracker/data/repositories/weather_repository.dart';
import 'package:weathertracker/infrastructure/http_client.dart';
import 'package:weathertracker/infrastructure/shared_preferences.dart';
import 'package:weathertracker/presentation/bloc/weather_bloc.dart';
import 'package:weathertracker/presentation/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MaterialApp(
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => SharedPreferencesHelper()),
          RepositoryProvider(create: (context) => WeatherHttpClient()),
          RepositoryProvider(
              create: (context) =>
                  WeatherRemoteDataSource(context.read<WeatherHttpClient>())),
          RepositoryProvider(
            create: (context) => WeatherRepository(
                remoteDataSource: context.read<WeatherRemoteDataSource>()),
          ),
        ],
        child: BlocProvider(
          create: (context) => WeatherBloc(context.read<WeatherRepository>(),
              context.read<SharedPreferencesHelper>()),
          child: const HomeScreen(),
        ),
      ),
    ),
  );
}
