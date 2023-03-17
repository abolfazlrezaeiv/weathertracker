import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathertracker/presentation/bloc/weather_bloc.dart';

class SavedCitiesTab extends StatelessWidget {
  final List<String> cities;
  const SavedCitiesTab({
    super.key,
    required TabController tabController,
    required this.cities,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cities.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(cities[index]),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            context.read<WeatherBloc>().add(CitySelectedEvent(cities[index]));
            _tabController.animateTo(0);
          },
        );
      },
    );
  }
}
