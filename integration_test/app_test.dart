// ignore_for_file: avoid_relative_lib_imports

import 'package:assignment_02/pages/current_weather_view.dart';
import 'package:assignment_02/widgets/current_temp.dart';
import 'package:assignment_02/widgets/daylight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:assignment_02/main.dart';
import 'package:assignment_02/models/current_weather.dart';

var calls = 0;

final weatherObjects = [
  CurrentWeather(
    city: 'Edmonton',
    description: 'partly cloudy',
    currentTemp: 24.5,
    currentTime: DateTime.parse('2024-08-01 12:00:00'),
    sunrise: DateTime.parse('2024-08-01 06:00:00'),
    sunset: DateTime.parse('2024-08-01 18:30:00'),
  ),
  CurrentWeather(
    city: 'Calgary',
    description: 'sunny',
    currentTemp: 28.4,
    currentTime: DateTime.parse('2024-08-01 12:00:00'),
    sunrise: DateTime.parse('2024-08-01 06:00:00'),
    sunset: DateTime.parse('2024-08-01 18:30:00'),
  ),
];

Future<CurrentWeather> _currentWeatherProvider({required String city}) async {
  final weatherData = weatherObjects[calls];
  calls += 1;
  return weatherData;
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    final cw1 = weatherObjects[0];
    final cw2 = weatherObjects[1];

    testWidgets(
        'MainApp properly mounts CurrentWeatherView and works as expected',
        (tester) async {
      // Load app widget.
      await tester.pumpWidget(const MainApp(
        provider: _currentWeatherProvider,
      ));

      // Wait for any initializaton to occur
      await tester.pumpAndSettle();

      expect(calls, 1);

      // Verify all required widgets
      expect(find.byType(CurrentWeatherView), findsOneWidget);
      expect(find.byType(CurrentTemp), findsOneWidget);
      expect(find.byType(Daylight), findsOneWidget);

      // Verify the data refresh

      // Before refresh
      expect(find.textContaining(RegExp(cw1.city, caseSensitive: false)),
          findsOneWidget);
      expect(find.textContaining(RegExp(cw1.description, caseSensitive: false)),
          findsOneWidget);

      final refreshButton = find.bySubtype<ButtonStyleButton>();

      await tester.tap(refreshButton);
      await tester.pumpAndSettle();

      // After refresh
      expect(find.textContaining(RegExp(cw2.city, caseSensitive: false)),
          findsOneWidget);
      expect(find.textContaining(RegExp(cw2.description, caseSensitive: false)),
          findsOneWidget);
    });
  });
}
