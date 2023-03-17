# weathertracker

WeatherAssess is a weather app built using the Flutter framework,
which uses state management BLoC to manage user interactions and display weather data.
The app utilizes the OpenWeatherMap API to retrieve current weather data for 30 cities, 
including Kuala Lumpur, George Town, Johor Bahru, and others.
Users can select a city to view the current weather conditions, 
or use the "Current Location" feature to display weather information for their current location.  
In addition to current weather data, the app also provides a 5-day weather forecast for the selected location, 
using the OpenWeatherMap API endpoint.
Users can also view weather data for three other cities of their choice in a carousel/tab view,
and can add additional cities from a list of available cities provided by the simplemaps.com API.  
All added cities are persisted using the shared_preferences package in Flutter, 
so that they remain valid even if the app is closed and reopened. 
WeatherAssess is a comprehensive weather app that provides users with accurate and up-to-date weather information, 
in a user-friendly and customizable format.

## Getting Started

To run the project you need to install the Flutter SDK 
this is the order of commands you need you run in terminal before running the app:

flutter pub get
flutter run

For more info check out Flutter.io
