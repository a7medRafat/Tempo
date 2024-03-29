import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import '../../../../../core/utils/condition_img.dart';
import '../../../data/models/SevenWeatherModel.dart';

class TomorrowBody extends StatelessWidget {
  final SevenWeatherModel sevenWeatherModel;

  const TomorrowBody({super.key, required this.sevenWeatherModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(conditionImg(sevenWeatherModel, 1),
            height: MediaQuery.of(context).size.width / 2.2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Tomorrow'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  GlowText(
                    sevenWeatherModel
                        .forecast!.forecastday![1].day!.maxtempC!
                        .toInt()
                        .toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontSize: 80),
                  ),
                  Row(
                    children: [
                      Text(
                        '/',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 35, color: Colors.white54),
                      ),
                      Text(
                        '${sevenWeatherModel.forecast!.forecastday![1].day!.mintempC!.toInt().toString()}\u00B0',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 30, color: Colors.white54),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              sevenWeatherModel
                  .forecast!.forecastday![1].day!.condition!.text!,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        )
      ],
    );
  }
}
