import 'package:flutter/material.dart';
import '../models/current_weather.dart';
import '../widgets/current_temp.dart';
import '../widgets/daylight.dart';

class CurrentWeatherView extends StatefulWidget {
  final Future<CurrentWeather> Function({required String city}) weatherProvider;

  const CurrentWeatherView({super.key, required this.weatherProvider});

  @override
  _CurrentWeatherViewState createState() => _CurrentWeatherViewState();
}

class _CurrentWeatherViewState extends State<CurrentWeatherView> {
  CurrentWeather? _currentWeather;

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  void _fetchWeather() {
    widget.weatherProvider(city: 'Edmonton').then((weather) {
      setState(() {
        _currentWeather = weather;
      });
    }).catchError((error) {});
  }

  void _refreshWeather() {
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    // While weather data is not yet fetched, show a loading indicator
    if (_currentWeather == null) {
      return const Center(child: CircularProgressIndicator());
    }

    // Once weather data is fetched, display it in the UI
    return Stack(
      children: [
        // Background image (clear sky)
        Positioned.fill(
          child: Image.asset(
            'assets/clear_sky.png',
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Padding around the whole screen
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // A single container for all text-based weather information
                Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // City name
                      Text(
                        _currentWeather!.city,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Weather description
                      Text(
                        _currentWeather!.description,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Current temperature and date
                      CurrentTemp(
                        temperature: _currentWeather!.currentTemp,
                        date: _currentWeather!.currentTime,
                      ),
                      const SizedBox(height: 10),
                      // Daylight widget (sunrise and sunset)
                      Daylight(
                        sunrise: _currentWeather!.sunrise,
                        sunset: _currentWeather!.sunset,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // Styled Refresh Button
                ElevatedButton(
                  onPressed: _refreshWeather,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.4),
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 6,
                  ),
                  child: const Text(
                    'Refresh Data',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
