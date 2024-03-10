import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/constants.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/SevenWeatherModel.dart';
import '../../../../core/failures_message/failures_messages.dart';
import '../../domain/usecases/get_weather_usecase.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherUseCase weatherUseCase;
  final drawerController = ZoomDrawerController();

  final city = TextEditingController();

  static WeatherCubit get(context) => BlocProvider.of(context);

  WeatherCubit({
    required this.weatherUseCase,
  }) : super(WeatherInitial());

  void getWeather() async {
    emit(WeatherLoadingState());
    Either<Failures, SevenWeatherModel> response =
        await weatherUseCase.call(city.text.isEmpty ? myLocation : city.text);
    response.fold(
        (failure) =>
            emit(WeatherErrorState(message: FailureMessage.failure(failure))),
        (weather) {
      city.clear();
      emit(WeatherLoadedState(sevenWeatherModel: weather));
    });
  }

  String buttonState = 'location permission';

  Future<bool> handleLocationPermission(context) async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      emit(LocationPermissionDeniedState());
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        emit(LocationPermissionDeniedState());

        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          padding: EdgeInsets.all(8),
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      emit(LocationPermissionDeniedState());

      return false;
    }
    if (serviceEnabled == true) {
      buttonState = 'get your location';
    }
    return true;
  }

  Future<void> getCurrentPosition(context) async {
    emit(GetCurrentPositionLoadingState());
    final hasPermission = await handleLocationPermission(context);
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      await getAddressFromLatLng(position);
      buttonState = 'get weather';
      emit(GetCurrentPositionSuccessState());
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      myLocation = '${place.subAdministrativeArea}';
    }).catchError((e) {
      debugPrint(e);
    });
  }
}
