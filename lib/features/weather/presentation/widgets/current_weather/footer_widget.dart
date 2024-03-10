import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/models/SevenWeatherModel.dart';

class FooterWidget extends StatelessWidget {
  final SevenWeatherModel weather;

  const FooterWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Icon(CupertinoIcons.wind_snow),
            ),
            Text(
              "${weather.current!.windKph!.round().toString()} %",
              style: const TextStyle(fontSize: 13),
            ),
            Text('Wind', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Icon(CupertinoIcons.drop),
            ),
            Text(
              '${weather.current!.humidity!.round().toString()} %',
              style: const TextStyle(fontSize: 13),
            ),
            Text('Humidity', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Icon(CupertinoIcons.cloud_bolt_rain),
            ),
            Text(
              '${weather.forecast!.forecastday![0].day!.dailyChanceOfRain!.round().toString()} %',
              style: const TextStyle(fontSize: 13),
            ),
            Text('Raining', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ],
    );
  }
}
