import 'package:flutter/material.dart';
import 'package:Tempo/features/weather/presentation/widgets/current_weather/virtical_divider.dart';
import '../../../../../config/app_colors.dart';
import '../../../data/models/SevenWeatherModel.dart';
import 'circle_percentage.dart';

class AstroWidget extends StatelessWidget {
  final SevenWeatherModel model;
  final int i;

  const AstroWidget({super.key, required this.model, required this.i});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: AppColors.stroColor
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      model.forecast!.forecastday![i].astro!.moonPhase
                          .toString(),
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodySmall),
                  CirclePercentage(
                    model: model,
                  )
                ],
              ),
              const Spacer(),
              const SecondDivider(),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sunrise: ${model.forecast!.forecastday![i].astro!
                          .sunrise}',
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodySmall,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Sunset: ${model.forecast!.forecastday![i].astro!
                          .sunset}',
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodySmall,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Moonrise: ${model.forecast!.forecastday![i].astro!
                          .moonrise}',
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodySmall,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Moonset:${model.forecast!.forecastday![i].astro!
                          .moonset}',
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodySmall,
                    ),
                  ]),
              const SizedBox(width: 20)
            ],
          ),
        ),
      ),
    );
  }
}
