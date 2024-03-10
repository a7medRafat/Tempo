import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/app.dart';
import 'app/bloc_observer.dart';
import 'core/shared_preferances/cache_helper.dart';
import 'app/injuctoin_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await di.init();
  await CacheHelper.init();

  runApp(const MyApp());
}
