import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/models/SevenWeatherModel.dart';

class ConChart extends StatelessWidget {
  const ConChart({super.key, required this.weatherModel});

  final SevenWeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    final forecast = weatherModel.forecast!.forecastday!;
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: const CategoryAxis(
        majorTickLines: MajorTickLines(
          width: 0.2,
          color: Colors.white38,
        ),
        majorGridLines: MajorGridLines(
            width: 0.2, color: Colors.white38, dashArray: <double>[5, 5]),
        axisLine: AxisLine(),
      ),
      primaryYAxis: const CategoryAxis(
        interval: 5,
        majorGridLines: MajorGridLines(
          width: 1,
          color: Colors.white12,
          dashArray: <double>[5, 5],
        ),
        majorTickLines: MajorTickLines(
          width: 0.2,
          color: Colors.white38,
        ),
        axisLine: AxisLine(),
        minimum: 0,
        maximum: 30,
      ),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CartesianSeries<ChartData, String>>[
        AreaSeries(
          borderColor: Colors.blue,
          borderWidth: 3,
          gradient: LinearGradient(
            colors: [
              Colors.blue.withOpacity(0.4),
              Colors.blue.withOpacity(0.2),
              Colors.blue.withOpacity(0.1)
            ],
            stops: const [0.0, 0.3, 0.6],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          dataSource: [
            ChartData('0', forecast[0].day!.maxtempC!.round()),
            ChartData('1', forecast[1].day!.maxtempC!.round()),
            ChartData('2', forecast[2].day!.maxtempC!.round()),
          ],
          xValueMapper: (ChartData sales, _) => sales.x,
          yValueMapper: (ChartData sales, _) => sales.y,
        ),
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final int? y;
}
