import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:weather_app/core/models/weather_model.dart';
import 'package:weather_app/core/network/remote/dio_helper.dart';
import 'package:weather_app/core/utils/blocs/app/states.dart';
import 'package:weather_app/core/utils/location/location.dart';
import 'package:weather_app/features/home/presentation/widgets/new_design_widgets/weather_first_page.dart';
import 'package:weather_app/features/home/presentation/widgets/new_design_widgets/weather_home_page.dart';

class AppBloc extends Cubit<AppStates>{
  AppBloc() : super(AppInitialState());

  static AppBloc get(context) =>BlocProvider.of(context);

  late WeatherModel model;
  // Map<String, dynamic>? mainWeather;
  double? tempMainWeather;
  double? minTempMainWeather;
  double? maxTempMainWeather;
  double? windSpeedMainWeather;
  int? humidityTempMainWeather;
  double? feelsLikeTempMainWeather;
  // List mainWeatherList = [];
  int? sysWeather;
  String? name;
  String? weatherDescription;

  // Map<String, dynamic>? mainSecondWeather;
  double? tempSecondMainWeather;
  double? minSecondTempMainWeather;
  double? maxSecondTempMainWeather;
  double? windSpeedSecondMainWeather;
  int? humiditySecondTempMainWeather;
  double? feelsLikeSecondTempMainWeather;
  // List mainWeatherList = [];
  Map<String, dynamic>? sysSecondWeather;
  String? secondName;
  String? weatherSecondDescription;

  void getWeather (
      String city,
      ){
    emit(AppLoadingState());
    DioHelper.getData(
      url: 'data/2.5/weather',
      query: {
        'q':city,
        'appid':'bd75fac350c7af7ef1d122cb96a7646d',
        'units':'metric'
      },
    ).then((value) {
      // debugPrint(value!.data.toString());
      name = value.data["name"];
      tempMainWeather = value.data["main"]["temp"];
      minTempMainWeather = value.data["main"]["temp_min"];
      maxTempMainWeather = value.data["main"]["temp_max"];
      feelsLikeTempMainWeather = value.data["main"]["feels_like"];
      windSpeedMainWeather = value.data["wind"]["speed"];
      humidityTempMainWeather = value.data["main"]["humidity"];
      sysWeather = value.data["sys"]["sunrise"];
      weatherDescription = value.data["weather"][0]["description"];
      // debugPrint(feelsLikeTempMainWeather.toString());
      // debugPrint(name);
      // debugPrint(weatherDescription.toString());


      emit(AppGetWeatherSuccessState());

    }).catchError((error){
      debugPrint(error.toString());
      emit(AppGetWeatherErrorState(error.toString()));
    });
  }
  void secondGetWeather (
      String city
      ){
    emit(AppLoadingState());
    DioHelper.getData(
      url: 'data/2.5/weather',
      query: {
        'q': city,
        'appid':'bd75fac350c7af7ef1d122cb96a7646d',
        'units':'metric'
      },
    ).then((value) {
      // debugPrint(value!.data.toString());
      secondName = value.data["name"];
      tempSecondMainWeather = value.data["main"]["temp"];
      minSecondTempMainWeather = value.data["main"]["temp_min"];
      maxSecondTempMainWeather = value.data["main"]["temp_max"];
      feelsLikeSecondTempMainWeather = value.data["main"]["feels_like"];
      windSpeedSecondMainWeather = value.data["wind"]["speed"];
      humiditySecondTempMainWeather = value.data["main"]["humidity"];
      sysSecondWeather = value.data["sys"];
      weatherSecondDescription = value.data["weather"][0]["description"];
      // debugPrint(feelsLikeTempMainWeather.toString());
      // debugPrint(sysWeather!.toString());
      // debugPrint(name);
      // debugPrint(weatherDescription.toString());


      emit(AppGetWeatherSuccessState());

    }).catchError((error){
      debugPrint(error.toString());
      emit(AppGetWeatherErrorState(error.toString()));
    });
  }

  // void getWeatherUsingLat(){
  //   emit(AppLoadingState());
  //   DioHelper.getData(
  //     url: 'data/2.5/weather',
  //     query: {
  //       'lat': '30.033333',
  //       'lon':'31.233334',
  //       'appid':'bd75fac350c7af7ef1d122cb96a7646d',
  //       'units':'metric'
  //     },
  //   ).then((value) {
  //     // debugPrint(value!.data.toString());
  //     secondName = value.data["name"];
  //     tempSecondMainWeather = value.data["main"]["temp"];
  //     minSecondTempMainWeather = value.data["main"]["temp_min"];
  //     maxSecondTempMainWeather = value.data["main"]["temp_max"];
  //     feelsLikeSecondTempMainWeather = value.data["main"]["feels_like"];
  //     windSpeedSecondMainWeather = value.data["wind"]["speed"];
  //     humiditySecondTempMainWeather = value.data["main"]["humidity"];
  //     sysSecondWeather = value.data["sys"];
  //     weatherSecondDescription = value.data["weather"][0]["description"];
  //     // debugPrint(feelsLikeTempMainWeather.toString());
  //     // debugPrint(sysWeather!.toString());
  //     // debugPrint(name);
  //     // debugPrint(weatherDescription.toString());
  //
  //
  //     emit(AppGetWeatherSuccessState());
  //   }).catchError((error){
  //     debugPrint(error.toString());
  //     emit(AppGetWeatherErrorState(error.toString()));
  //   });
  //
  // }


  List<Widget> screens = [
    const WeatherHomepageWidget(),
    const WeatherFirstPageWidget(),
  ];

  TextEditingController searchController = TextEditingController();

  double? searchMainWeather;
  String? searchName;
  String? weatherSearchDescription;
  void getSearchResult(
      String city,
      ){
    emit(AppSearchLoadingState());
    DioHelper.getData(
      url: 'data/2.5/weather',
      query: {
        'q': city,
        'appid':'bd75fac350c7af7ef1d122cb96a7646d',
        'units':'metric'
      },).then((value) {
      searchName = value.data["name"];
      weatherSearchDescription = value.data["weather"][0]["description"];
      searchMainWeather = value.data["main"]["temp"];
      debugPrint(searchName);
        emit(AppSearchWeatherSuccessState());
    }).catchError((error){
        debugPrint(error.toString());
        emit(AppSearchWeatherErrorState(error));
    });
  }

  TextEditingController firstCountryController = TextEditingController();
  TextEditingController secondCountryController = TextEditingController();


}