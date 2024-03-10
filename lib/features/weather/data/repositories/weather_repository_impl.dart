import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/local/weather_local_data_source.dart';
import '../datasources/remote/weather_remote_data_source.dart';
import '../models/SevenWeatherModel.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final NetworkInfo networkInfo;
  final WeatherRemoteDataSource remoteDataSource;
  final WeatherLocalDataSource localDataSource;

  WeatherRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failures, SevenWeatherModel>> getWeather(
      String cityName) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteWeather = await remoteDataSource.getWeather(cityName);
        localDataSource.cachesWeather(remoteWeather);
        return right(remoteWeather);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localWeather = await localDataSource.getCachedWeather();
        return right(localWeather);
      } on EmptyCacheException {
        return left(EmptyCacheFailure());
      }
    }
  }
}
