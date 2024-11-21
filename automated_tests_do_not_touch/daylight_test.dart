// ignore_for_file: avoid_relative_lib_imports
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

import '../lib/widgets/daylight.dart';
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
  group('Daylight widget', () {
    testWidgets(
        'Is a StatefulWidget and requires named sunrise and sunset params',
        (tester) async {
      Daylight dl = Daylight(
          sunrise: currentWeather.sunrise, sunset: currentWeather.sunset);

      expect(dl, isA<StatefulWidget>());
    });
    testWidgets('Renders the sunrise', (tester) async {
      DateFormat formatter = DateFormat('h:mm a');

      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: Daylight(
                  sunrise: currentWeather.sunrise,
                  sunset: currentWeather.sunset))));

      final sunriseFinder =
          find.textContaining(formatter.format(currentWeather.sunrise));

      expect(sunriseFinder, findsOneWidget);
    });
    testWidgets('Renders the sunset', (tester) async {
      DateFormat formatter = DateFormat('h:mm a');

      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: Daylight(
                  sunrise: currentWeather.sunrise,
                  sunset: currentWeather.sunset))));

      final sunset =
          find.textContaining(formatter.format(currentWeather.sunset));

      expect(sunset, findsOneWidget);
    });
    testWidgets('Toggles visibility of hours of daylight when tapped',
        (tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: Daylight(
                  sunrise: currentWeather.sunrise,
                  sunset: currentWeather.sunset))));

      // Use the first Text widget as a proxy for the gesture detector
      final firstTextFinder = find.byType(Text).first;
      final daylightFinder = find.textContaining(
          RegExp('12 hours and 30 minutes', caseSensitive: false));

      expect(daylightFinder, findsNothing);
      await tester.tap(firstTextFinder);
      await tester.pumpAndSettle();
      expect(daylightFinder, findsOneWidget);
      await tester.tap(firstTextFinder);
      await tester.pumpAndSettle();
      expect(daylightFinder, findsNothing);
    });
  });
}
