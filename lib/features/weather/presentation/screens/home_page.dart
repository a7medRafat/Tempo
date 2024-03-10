import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../../../core/utils/loading_widget.dart';
import '../../../../core/utils/sliver_app_bar.dart';
import '../../../../core/utils/sliver_list_widget.dart';
import '../cubit/weather_cubit.dart';
import '../widgets/current_weather/divider_widget.dart';
import '../widgets/current_weather/header_widget.dart';
import '../widgets/location/error_location.dart';
import '../widgets/current_weather/footer_widget.dart';
import '../widgets/current_weather/weather_degree.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            return const LoadingWidget();
          } else if (state is WeatherLoadedState) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverAppBarWidget(
                  expandedHeight: size.height * 0.75,
                  containerHeight: size.height * 0.73,
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      HeaderWidget(
                        model: state.sevenWeatherModel,
                        title: state.sevenWeatherModel.location!.name!,
                        icon: Icons.location_on_outlined,
                        fun: () => ZoomDrawer.of(context)!.open(),
                      ),
                      WeatherDegree(weather: state.sevenWeatherModel),
                      const Spacer(),
                      const MyDivider(),
                      FooterWidget(weather: state.sevenWeatherModel),
                    ],
                  ),
                  weatherModel: state.sevenWeatherModel,
                ),
                SliverListWidget(weatherModel: state.sevenWeatherModel)
              ],
            );
          } else {
            return const ErrorLocation();
          }
        },
      ),
    );
  }
}
