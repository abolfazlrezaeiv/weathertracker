import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathertracker/presentation/bloc/weather_bloc.dart';
import 'package:weathertracker/presentation/styles/strings.dart';
import 'package:weathertracker/presentation/styles/text_themes.dart';
import 'package:weathertracker/presentation/widgets/drawer_city_list.dart';
import 'package:weathertracker/presentation/widgets/saved_cities_tab.dart';
import 'package:weathertracker/presentation/widgets/weather_info_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.read<WeatherBloc>().add(LocationButtonPressedEvent());
          },
          icon: const Icon(Icons.person_pin_rounded),
        ),
        actions: [
          TextButton(
            onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
            child: const Text(
              AppString.SELECT_CITY,
              style: AppTextTheme.size20BoldWhite,
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Text(AppString.HOME, style: AppTextTheme.size20BoldWhite),
            Text(AppString.SAVED, style: AppTextTheme.size20BoldWhite),
          ],
        ),
      ),
      endDrawer: DrawerCityListSelectable(
          scaffoldKey: _scaffoldKey, tabController: _tabController),
      body: BlocBuilder<WeatherBloc, WeatherInitialState>(
        builder: (context, state) {
          if (state is WeatherDataFetchState) {
            return TabBarView(
              controller: _tabController,
              children: [
                WeatherInfoTab(
                  temperature: state.weatherData.temperature.toString(),
                  cityName: state.weatherData.cityName.toString(),
                ),
                SavedCitiesTab(
                  tabController: _tabController,
                  cities: state.cities,
                )
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
