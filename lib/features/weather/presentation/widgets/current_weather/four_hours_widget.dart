import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import '../../../../../config/app_colors.dart';
import '../../../../../core/utils/condition_img.dart';
import '../../../../../core/utils/hour_conditioning.dart';
import '../../../data/models/SevenWeatherModel.dart';

// ignore: must_be_immutable
class FourHoursWidget extends StatelessWidget {
  final SevenWeatherModel weatherModel;

  FourHoursWidget({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    final int current = DateTime.now().hour;
    final day = weatherModel.forecast!.forecastday![0];

    final one = day.hour![0].time;
    final two = day.hour![current].time;
    final three = day.hour![5].time;
    final four = day.hour![15].time;
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.16,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildBodyItem(
                context: context,
                bodyNumber: one.toString(),
                model: weatherModel,
                i: 0),
            _buildSelectedItem(
                context: context,
                bodyNumber: two.toString(),
                model: weatherModel),
            _buildBodyItem(
                context: context,
                bodyNumber: three.toString(),
                model: weatherModel,
                i: 5),
            _buildBodyItem(
                context: context,
                bodyNumber: four.toString(),
                model: weatherModel,
                i: 15),
          ],
        ));
  }

  bool isHovering = true;

  Widget _buildBodyItem({
    required BuildContext context,
    required String bodyNumber,
    required SevenWeatherModel model,
    required int i,
  }) =>
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.white54, width: 0.4)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  '${weatherModel.forecast!.forecastday![0].hour![i].tempC!.toString()}\u00B0'),
              Image.asset(
                hourConditionImg(weatherModel, i),
                width: 50,
                height: 50,
                fit: BoxFit.fill,
              ),
              Text(
                bodyNumber.substring(bodyNumber.length - 5),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      );

  Widget _buildSelectedItem({
    required BuildContext context,
    required String bodyNumber,
    required SevenWeatherModel model,
  }) =>
      AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
          color: isHovering ? AppColors.appColor : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: GlowContainer(
          glowColor: AppColors.glowColor,
          spreadRadius: 5,
          borderRadius: BorderRadius.circular(25),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    '${weatherModel.forecast!.forecastday![0].hour![1].tempC!.toString()}\u00B0'),
                Image.asset(
                  conditionImg(weatherModel, 0),
                  width: 50,
                  height: 50,
                  fit: BoxFit.fill,
                ),
                Text(
                  bodyNumber.substring(bodyNumber.length - 5),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      );
}
