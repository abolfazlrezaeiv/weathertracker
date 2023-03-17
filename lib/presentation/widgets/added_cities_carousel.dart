import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AddedCitiesCarousel extends StatelessWidget {
  final List<String> cities;

  const AddedCitiesCarousel({super.key, required this.cities});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(),
      items: cities
          .map((item) => Card(
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Center(
                    child: Text(
                      item,
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
