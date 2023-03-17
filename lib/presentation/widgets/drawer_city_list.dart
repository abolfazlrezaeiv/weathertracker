import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathertracker/presentation/bloc/weather_bloc.dart';
import 'package:weathertracker/presentation/styles/paddings.dart';
import 'package:weathertracker/presentation/styles/strings.dart';
import 'package:weathertracker/presentation/styles/text_themes.dart';

class DrawerCityListSelectable extends StatelessWidget {
  const DrawerCityListSelectable({
    super.key,
    required GlobalKey<ScaffoldState> scaffoldKey,
    required TabController tabController,
  })  : _scaffoldKey = scaffoldKey,
        _tabController = tabController;

  final GlobalKey<ScaffoldState> _scaffoldKey;
  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemCount: AppString.cities.length,
        itemBuilder: (context, index) => Padding(
          padding: AppPadding.all30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListTile(
                  onTap: () {
                    context
                        .read<WeatherBloc>()
                        .add(CitySelectedEvent(AppString.cities[index]));
                    _scaffoldKey.currentState?.closeEndDrawer();
                  },
                  title: Text(AppString.cities[index],
                      style: AppTextTheme.size20BoldBlack),
                  trailing: const Text('|'),
                ),
              ),
              IconButton(
                onPressed: () {
                  context
                      .read<WeatherBloc>()
                      .add(AddCityToListEvent(AppString.cities[index]));
                  _scaffoldKey.currentState?.closeEndDrawer();
                  _tabController.animateTo(1);
                },
                icon: const Card(child: Icon(Icons.add, color: Colors.blue)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
