import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathertracker/presentation/bloc/weather_bloc.dart';
import 'package:weathertracker/presentation/styles/paddings.dart';
import 'package:weathertracker/presentation/styles/strings.dart';
import 'package:weathertracker/presentation/styles/text_themes.dart';
import 'package:weathertracker/presentation/widgets/added_cities_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leadingWidth: 200,
        leading: ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.location_history),
          label: const Text(AppString.FIND_CITY),
        ),
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer();
            },
            icon: const Icon(Icons.menu),
            label: const Text(AppString.SELECT_CITY),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: AppString.cities
              .map((city) => Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(city),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            color: Colors.red,
                          ))
                    ],
                  )))
              .toList(),
        ),
      ),
      body: BlocBuilder<WeatherBloc, WeatherInitialState>(
        builder: (context, state) {
          return ListView(
            children: [
              if (state is WeatherDataFetchState)
                Padding(
                  padding: AppPadding.top100,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          state.weatherData.temperature.toString(),
                          style: AppTextTheme.size40bold,
                        ),
                        Text(
                          state.weatherData.cityName,
                          style: AppTextTheme.size40bold,
                        ),
                      ],
                    ),
                  ),
                ),
              const Padding(
                padding: AppPadding.top100,
                child: AddedCitiesCarousel(
                  cities: [],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
