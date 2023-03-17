import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _keyCities = "cities";

  Future<void> addCity(String city) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> cities = prefs.getStringList(_keyCities) ?? [];
    cities.add(city);
    await prefs.setStringList(_keyCities, cities.toSet().toList());
  }

  Future<List<String>> getCities() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> cities = prefs.getStringList(_keyCities) ?? [];
    return cities;
  }
}
