import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/SevenWeatherModel.dart';
import '../repositories/weather_repository.dart';

class GetWeatherUseCase {
  final WeatherRepository weatherRepository;

  GetWeatherUseCase({required this.weatherRepository});

  Future<Either<Failures, SevenWeatherModel>> call(String cityName) async {
    return await weatherRepository.getWeather(cityName);
  }
}
