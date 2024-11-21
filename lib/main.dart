import 'package:flutter/material.dart';

// current weather view and the current weather model
import 'package:assignment_02/pages/current_weather_view.dart';
import 'models/current_weather.dart';

// A mock weather provider function
Future<CurrentWeather> _currentWeatherProvider({required String city}) async {
  return CurrentWeather(
    city: 'Edmonton',
    description: 'partly cloudy',
    currentTemp: 24.5,
    currentTime: DateTime.parse('2024-08-01 12:00:00'),
    sunrise: DateTime.parse('2024-08-01 06:00:00'),
    sunset: DateTime.parse('2024-08-01 18:30:00'),
  );
}

void main() {
  runApp(MainApp(provider: _currentWeatherProvider));
}

class MainApp extends StatelessWidget {
  final Future<CurrentWeather> Function({required String city}) provider;

  const MainApp({required this.provider, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CurrentWeatherView(weatherProvider: provider),  // Replaced the placeholder with your CurrentWeatherView widget
      ),
    );
  }
}
