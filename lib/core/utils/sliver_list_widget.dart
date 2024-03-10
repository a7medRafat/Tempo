import 'package:flutter/material.dart';
import '../../features/weather/data/models/SevenWeatherModel.dart';
import '../../features/weather/presentation/widgets/current_weather/Astrospheric_widget.dart';
import '../../features/weather/presentation/widgets/current_weather/four_hours_widget.dart';
import '../../features/weather/presentation/widgets/current_weather/impresive.dart';
import '../../features/weather/presentation/widgets/current_weather/side_text_widget.dart';
import '../../features/weather/presentation/widgets/current_weather/today_weather_widget.dart';

class SliverListWidget extends StatelessWidget {
  const SliverListWidget({super.key, required this.weatherModel});

  final SevenWeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TodayWeather(model: weatherModel),
                  FourHoursWidget(weatherModel: weatherModel),
                  const SideTextWidget(
                    text: 'Astronomy Weather Forecasts',
                  ),
                  AstroWidget(model: weatherModel, i: 0),
                  const SideTextWidget(text: 'Forecasting week')
                ],
              ),
            ),
            ConChart(weatherModel: weatherModel)
          ],
        ),
      ]),
    );
  }
}
