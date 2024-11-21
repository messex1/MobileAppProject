import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrentTemp extends StatelessWidget {
  final DateTime date;
  final double temperature;

  const CurrentTemp({required this.date, required this.temperature, super.key});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE, MMM d yyyy h:mm a').format(date);
    String formattedTemp = '${temperature.round()}°C';

    return Column(
      children: [
        Text(
          formattedDate,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
        ),
        Text(
          formattedTemp,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
