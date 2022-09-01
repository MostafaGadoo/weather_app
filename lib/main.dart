import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/network/remote/dio_helper.dart';
import 'package:weather_app/core/utils/blocs/app/cubit.dart';
import 'package:weather_app/features/home/presentation/pages/home_page.dart';
import 'package:weather_app/features/home/presentation/pages/new_design/weather_home_page.dart';
import 'package:weather_app/features/home/presentation/pages/new_design/on_boarding.dart';
import 'package:weather_app/features/home/presentation/widgets/home_widget_scroll.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //..getWeather('${AppBloc.get(context).firstCountryController}')..secondGetWeather('Cairo'),
      create: (context) => AppBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            elevation: 0.0,
          ),
          primarySwatch: Colors.blue,
        ),
        home: const OnBoardingHomeScreen(),
      ),
    );
  }
}


