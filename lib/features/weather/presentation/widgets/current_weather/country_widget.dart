import 'package:flutter/material.dart';
import '../../../data/models/SevenWeatherModel.dart';
import '../../../../../core/constants.dart';

class CountryWidget extends StatelessWidget {
  final SevenWeatherModel weather;

  const CountryWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white54, width: borderWidth)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.circle, color: Colors.lightGreen, size: 8),
              const SizedBox(width: 4),
              Text(weather.location!.country.toString(),
                  style: Theme.of(context).textTheme.bodySmall)
            ],
          ),
        ));
  }
}
