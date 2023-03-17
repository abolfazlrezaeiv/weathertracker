import 'package:flutter/material.dart';
import 'package:weathertracker/presentation/styles/text_themes.dart';

class WeatherInfoTab extends StatelessWidget {
  final String temperature;
  final String cityName;
  const WeatherInfoTab({
    super.key,
    required this.temperature,
    required this.cityName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(temperature, style: AppTextTheme.size40bold),
        Text(cityName, style: AppTextTheme.size20BoldBlack)
      ],
    );
  }
}
