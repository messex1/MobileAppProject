/// Used to represent the current weather conditions in a city.
class CurrentWeather {
  late String city;
  late String description;
  late double currentTemp;
  late DateTime currentTime;
  late DateTime sunrise;
  late DateTime sunset;

  /// Create a CurrentWeather object with the given [city], [description],
  /// [currentTemp], [currentTime], [sunrise], and [sunset].
  CurrentWeather(
      {required this.city,
      required this.description,
      required this.currentTemp,
      required this.currentTime,
      required this.sunrise,
      required this.sunset});

  get temp => null;
}
