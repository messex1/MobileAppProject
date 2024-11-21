// ignore_for_file: avoid_relative_lib_imports
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

import '../lib/widgets/current_temp.dart';
import '../lib/models/current_weather.dart';

CurrentWeather currentWeather = CurrentWeather(
  city: 'Edmonton',
  description: 'partly cloudy',
  currentTemp: 24.5,
  currentTime: DateTime.parse('2024-08-01 12:00:00'),
  sunrise: DateTime.parse('2024-08-01 06:00:00'),
  sunset: DateTime.parse('2024-08-01 18:30:00'),
);

Future<CurrentWeather> mockWeatherProvider({required String city}) async {
  return currentWeather;
}

void main() {
  group('CurrentTemp widget', () {
    testWidgets(
        'Is a StatelessWidget and requires named temperature and date params',
        (tester) async {
      CurrentTemp ct = CurrentTemp(
          temperature: currentWeather.currentTemp,
          date: currentWeather.currentTime);
      expect(ct, isA<StatelessWidget>());
    });
    testWidgets('Renders the current date', (tester) async {
      DateFormat formatter = DateFormat('MMM d yyyy h:mm a');

      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: CurrentTemp(
                  temperature: currentWeather.currentTemp,
                  date: currentWeather.currentTime))));

      final cityFinder = find.textContaining(RegExp(
          formatter.format(currentWeather.currentTime),
          caseSensitive: false));

      expect(cityFinder, findsOneWidget);
    });
    testWidgets('Renders the current temperature rounded to nearest degree',
        (tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: CurrentTemp(
                  temperature: currentWeather.currentTemp,
                  date: currentWeather.currentTime))));

      final temperatureFinder = find
          .textContaining('${currentWeather.currentTemp.toStringAsFixed(0)}°C');

      expect(temperatureFinder, findsOneWidget);
    });
  });
}
