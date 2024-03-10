import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/app_colors.dart';
import '../../../../core/constants.dart';
import '../../../../core/shared_preferances/cache_helper.dart';
import '../../../../core/utils/button.dart';
import '../../../../core/utils/go.dart';
import '../../../../core/utils/loading_widget.dart';
import '../cubit/weather_cubit.dart';
import 'drawer_Screen.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.containerColor,
        body: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => CacheHelper.removeData(key: 'isLocated'),
                  child: SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 2,
                    child: Image.asset(
                      'assets/images/board.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text(
                  'take care of your day by checking \n the weather forecast',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white70, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.location_on_outlined),
                      const SizedBox(width: 5),
                      Text(
                        myLocation,
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyMedium!,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: BlocBuilder<WeatherCubit, WeatherState>(
                    builder: (context, state) {
                      if (state is GetCurrentPositionLoadingState) {
                        return const LoadingWidget();
                      }
                      return AppButton(
                        widget: myLocation.isEmpty
                            ? TextButton(
                            onPressed: () {
                              WeatherCubit.get(context)
                                  .getCurrentPosition(context);
                            },
                            child: Text(
                              WeatherCubit
                                  .get(context)
                                  .buttonState,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.blue),
                            ))
                            : TextButton(
                            onPressed: () {
                              WeatherCubit.get(context).getWeather();
                              navigateAndFinish(context, const Zoom());
                              CacheHelper.saveData(
                                  key: 'isLocated',
                                  value: myLocation.toString());
                            },
                            child: Text(
                                WeatherCubit
                                    .get(context)
                                    .buttonState,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.blue))),
                        color: Colors.white,
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ));
  }
}
