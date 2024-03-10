import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import '../../../data/models/SevenWeatherModel.dart';
import 'country_widget.dart';
import 'image_widget.dart';

class WeatherDegree extends StatelessWidget {
  final SevenWeatherModel weather;

  const WeatherDegree({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.9,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(top: 5, child: CountryWidget(weather: weather)),
          ImageWidget(
            weatherModel: weather,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GlowText(
                  "${weather.forecast!.forecastday![0].day!.maxtempC!.round()}",
                  style: Theme.of(context).textTheme.headlineLarge),
              Text(
                weather.forecast!.forecastday![0].day!.condition!.text
                    .toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 20),
              ),
              Text(
                weather.forecast!.forecastday![0].date.toString(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
