import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../cubit/weather_cubit.dart';
import '../widgets/current_weather/choose_city_widget.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        if (state is WeatherLoadedState) {
          ZoomDrawer.of(context)!.close();
        }
        if (state is WeatherErrorState) {
          ZoomDrawer.of(context)!.close();
        }
      },
      builder: (context, state) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChooseCityWidget(
                    controller: WeatherCubit.get(context).city,
                    hint: 'Choose City',
                    fun: () {
                      if (formKey.currentState!.validate()) {
                        WeatherCubit.get(context).getWeather();

                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
