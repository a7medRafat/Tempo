import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import '../../config/app_colors.dart';
import '../../features/weather/data/models/SevenWeatherModel.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({
    super.key,
    required this.expandedHeight,
    required this.containerHeight,
    required this.widget,
    required this.weatherModel,
  });

  final Widget widget;
  final double expandedHeight;
  final double containerHeight;
  final SevenWeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100))),
      expandedHeight: expandedHeight,
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 2,
        background: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GlowContainer(
                padding: const EdgeInsets.all(10),
                height: containerHeight,
                alignment: Alignment.topCenter,
                glowColor: AppColors.glowColor,
                spreadRadius: 5,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(70)),
                color: AppColors.containerColor,
                child: widget),
          ],
        ),
      ),
    );
  }
}
