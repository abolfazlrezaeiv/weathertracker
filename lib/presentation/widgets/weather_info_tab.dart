import 'package:flutter/material.dart';
import 'package:weathertracker/domain/entities/forecast.dart';
import 'package:weathertracker/presentation/styles/strings.dart';
import 'package:weathertracker/presentation/styles/text_themes.dart';

class WeatherInfoTab extends StatelessWidget {
  final String temperature;
  final String cityName;
  final List<Forecast> forecast;
  const WeatherInfoTab({
    super.key,
    required this.temperature,
    required this.cityName,
    required this.forecast,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(temperature, style: AppTextTheme.size40bold),
        Text(cityName, style: AppTextTheme.size20BoldBlack),
        forecast.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(AppString.FIVE_DAY_FORECAST,
                        style: AppTextTheme.size20BoldBlack),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: forecast
                          .map((weather) => Text(weather.temperature.toString(),
                              style: AppTextTheme.size20BoldBlack))
                          .toList(),
                    ),
                  ],
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
