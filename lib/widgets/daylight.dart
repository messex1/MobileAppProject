import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Daylight extends StatefulWidget {
  final DateTime sunrise;
  final DateTime sunset;

  const Daylight({
    super.key,
    required this.sunrise,
    required this.sunset,
  });

  @override
  _DaylightState createState() => _DaylightState();
}

class _DaylightState extends State<Daylight> {
  bool showDaylightDuration = false;

  @override
  Widget build(BuildContext context) {
    // Formatting the sunrise and sunset times
    final dateFormat = DateFormat('h:mm a');
    final sunriseTime = dateFormat.format(widget.sunrise);
    final sunsetTime = dateFormat.format(widget.sunset);

    // Calculating the total daylight duration
    final duration = widget.sunset.difference(widget.sunrise);
    final daylightHours = duration.inHours;
    final daylightMinutes = duration.inMinutes % 60;

    return GestureDetector(
      onTap: () {
        setState(() {
          showDaylightDuration = !showDaylightDuration;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ensure the text color is white
          Text(
            'Sunrise: $sunriseTime',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white, // Text color set to white
            ),
          ),
          Text(
            'Sunset: $sunsetTime',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white, // Text color set to white
            ),
          ),
          if (showDaylightDuration)
            Text(
              'Daylight: $daylightHours hours and $daylightMinutes minutes',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white, // Text color set to white
              ),
            ),
        ],
      ),
    );
  }
}
