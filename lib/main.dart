import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/network/local/cache_helper.dart';
import 'package:weather_app/core/network/remote/dio_helper.dart';
import 'package:weather_app/core/utils/blocs/app/cubit.dart';
import 'package:weather_app/features/home/presentation/pages/home_page.dart';
import 'package:weather_app/features/home/presentation/pages/new_design/select_country_home.dart';
import 'package:weather_app/features/home/presentation/pages/new_design/weather_home_page.dart';
import 'package:weather_app/features/home/presentation/pages/new_design/on_boarding.dart';
import 'package:weather_app/features/home/presentation/widgets/home_widget_scroll.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper();
  await CacheHelper.init();

  // late bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // final bool onBoarding;
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
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            elevation: 0.0,
          ),
          primarySwatch: Colors.deepOrange,
        ),
        home:  const OnBoardingHomeScreen(),
          //onBoarding ? const SelectCountryHome() : const OnBoardingHomeScreen(),
      ),
    );
  }
}


