import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../cubit/weather_cubit.dart';
import 'home_page.dart';
import 'menue_screen.dart';

class Zoom extends StatefulWidget {
  const Zoom({super.key});

  @override
  State<Zoom> createState() => _ZoomState();
}

class _ZoomState extends State<Zoom> {


  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = WeatherCubit.get(context);
    return Scaffold(
      body: ZoomDrawer(
        controller: cubit.drawerController,
        style: DrawerStyle.defaultStyle,
        borderRadius: 24.0,
        slideWidth: MediaQuery
            .of(context)
            .size
            .width * (0.6),
        openCurve: Curves.fastLinearToSlowEaseIn,
        closeCurve: Curves.bounceIn,
        angle: 0.0,
        showShadow: true,
        menuScreen: const MenuDrawer(),
        mainScreen: const Home(),
      ),
    );
  }
}
