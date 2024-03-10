import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/condition_img.dart';
import '../../../data/models/SevenWeatherModel.dart';

class ImageWidget extends StatelessWidget {
  final SevenWeatherModel weatherModel;

  const ImageWidget({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Image.asset(

      conditionImg(weatherModel, 0),
      fit: BoxFit.cover,
    );
  }
}
