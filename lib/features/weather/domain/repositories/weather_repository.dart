import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/SevenWeatherModel.dart';

abstract class WeatherRepository {
  Future<Either<Failures, SevenWeatherModel>> getWeather(String cityName);
}
