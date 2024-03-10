import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../config/app_theme.dart';
import '../core/shared_preferances/cache_helper.dart';
import '../features/weather/presentation/cubit/weather_cubit.dart';
import '../features/weather/presentation/screens/drawer_Screen.dart';
import '../features/weather/presentation/screens/location_page.dart';
import 'injuctoin_container.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  Widget build(BuildContext context) {
    dynamic isLocated = CacheHelper.getData(key: 'isLocated');
    final Widget widget;

    if (isLocated != null) {
      widget = const Zoom();
    } else {
      widget = const LocationPage();
    }
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: BlocProvider(
          create: (_) => sl<WeatherCubit>()..getWeather(),
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: appTheme(),
              home: widget),
        ));
  }
}
