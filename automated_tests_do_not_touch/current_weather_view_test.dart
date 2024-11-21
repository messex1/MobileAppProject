// ignore_for_file: avoid_relative_lib_imports
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/pages/current_weather_view.dart';
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
  group('CurrentWeatherView widget', () {
    testWidgets('Is a StatefulWidget and requires named weatherProvider param',
        (tester) async {
      CurrentWeatherView cwv =
          const CurrentWeatherView(weatherProvider: mockWeatherProvider);
      expect(cwv, isA<StatefulWidget>());
    });
    testWidgets('Renders the city', (tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
              body: CurrentWeatherView(weatherProvider: mockWeatherProvider))));

      await tester.pumpAndSettle();

      final cityFinder = find.text(currentWeather.city);

      expect(cityFinder, findsOneWidget);
    });
    testWidgets('Renders the description', (tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
              body: CurrentWeatherView(weatherProvider: mockWeatherProvider))));

      await tester.pumpAndSettle();

      final descriptionFinder = find.textContaining(
          RegExp(currentWeather.description, caseSensitive: false));

      expect(descriptionFinder, findsOneWidget);
    });
    testWidgets('Renders a refresh data button', (tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
              body: CurrentWeatherView(weatherProvider: mockWeatherProvider))));

      await tester.pumpAndSettle();

      final buttonFinder = find.bySubtype<ButtonStyleButton>();

      expect(buttonFinder, findsOneWidget);
    });
    testWidgets(
        'Calls the weather provider and updates the current weather when refresh button tapped',
        (tester) async {
      var calls = 0;

      Future<CurrentWeather> mockWeatherProvider({required String city}) async {
        calls += 1;
        if (calls == 1) {
          return currentWeather;
        } else {
          return CurrentWeather(
            city: 'Calgary',
            description: 'sunny',
            currentTemp: 25.0,
            currentTime: DateTime.now(),
            sunrise: DateTime.now(),
            sunset: DateTime.now(),
          );
        }
      }

      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: CurrentWeatherView(weatherProvider: mockWeatherProvider))));

      await tester.pumpAndSettle();

      expect(calls, 1);

      final buttonFinder = find.bySubtype<ButtonStyleButton>();

      await tester.tap(buttonFinder);

      await tester.pumpAndSettle();

      expect(calls, 2);
      // Check that the new city is rendered, assume the rest of the data is updated as well
      expect(find.text('Calgary'), findsOneWidget);
    });
  });
}
