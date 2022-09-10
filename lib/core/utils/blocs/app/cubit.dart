import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:weather_app/core/models/current_weather_model.dart';
import 'package:weather_app/core/models/favorite_city_model.dart';
import 'package:weather_app/core/models/search_model.dart';
import 'package:weather_app/core/network/remote/dio_helper.dart';
import 'package:weather_app/core/network/remote/end_points.dart';
import 'package:weather_app/core/utils/blocs/app/states.dart';
import 'package:weather_app/core/utils/location/location.dart';
import 'package:weather_app/features/home/presentation/widgets/new_design_widgets/weather_first_page.dart';
import 'package:weather_app/features/home/presentation/widgets/new_design_widgets/weather_home_page.dart';

class AppBloc extends Cubit<AppStates> {
  AppBloc() : super(AppInitialState());

  static AppBloc get(context) => BlocProvider.of(context);

  // late CurrentWeatherModel model;
  // Map<String, dynamic>? mainWeather;
  // double? tempMainWeather;
  // double? minTempMainWeather;
  // double? maxTempMainWeather;
  // double? windSpeedMainWeather;
  // int? humidityTempMainWeather;
  // double? feelsLikeTempMainWeather;
  //
  // // List mainWeatherList = [];
  // int? sysWeather;
  // String? name;
  // String? weatherDescription;
  //
  // // Map<String, dynamic>? mainSecondWeather;
  // double? tempSecondMainWeather;
  // double? minSecondTempMainWeather;
  // double? maxSecondTempMainWeather;
  // double? windSpeedSecondMainWeather;
  // int? humiditySecondTempMainWeather;
  // double? feelsLikeSecondTempMainWeather;
  //
  // // List mainWeatherList = [];
  // Map<String, dynamic>? sysSecondWeather;
  // String? secondName;
  // String? weatherSecondDescription;
  //
  // void getWeather(String city,) {
  //   emit(AppLoadingState());
  //   DioHelper.getData(
  //     url: 'data/2.5/weather',
  //     query: {
  //       'q': city,
  //       'appid': 'bd75fac350c7af7ef1d122cb96a7646d',
  //       'units': 'metric'
  //     },
  //   ).then((value) {
  //     // debugPrint(value!.data.toString());
  //     name = value.data["name"];
  //     tempMainWeather = value.data["main"]["temp"];
  //     minTempMainWeather = value.data["main"]["temp_min"];
  //     maxTempMainWeather = value.data["main"]["temp_max"];
  //     feelsLikeTempMainWeather = value.data["main"]["feels_like"];
  //     windSpeedMainWeather = value.data["wind"]["speed"];
  //     humidityTempMainWeather = value.data["main"]["humidity"];
  //     sysWeather = value.data["sys"]["sunrise"];
  //     weatherDescription = value.data["weather"][0]["description"];
  //     // debugPrint(feelsLikeTempMainWeather.toString());
  //     // debugPrint(name);
  //     // debugPrint(weatherDescription.toString());
  //
  //
  //     emit(AppGetWeatherSuccessState());
  //   }).catchError((error) {
  //     debugPrint(error.toString());
  //     emit(AppGetWeatherErrorState(error.toString()));
  //   });
  // }
  //
  // void secondGetWeather(String city) {
  //   emit(AppLoadingState());
  //   DioHelper.getData(
  //     url: 'data/2.5/weather',
  //     query: {
  //       'q': city,
  //       'appid': 'bd75fac350c7af7ef1d122cb96a7646d',
  //       'units': 'metric'
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
  //   }).catchError((error) {
  //     debugPrint(error.toString());
  //     emit(AppGetWeatherErrorState(error.toString()));
  //   });
  // }
  //
  // // void getWeatherUsingLat(){
  // //   emit(AppLoadingState());
  // //   DioHelper.getData(
  // //     url: 'data/2.5/weather',
  // //     query: {
  // //       'lat': '30.033333',
  // //       'lon':'31.233334',
  // //       'appid':'bd75fac350c7af7ef1d122cb96a7646d',
  // //       'units':'metric'
  // //     },
  // //   ).then((value) {
  // //     // debugPrint(value!.data.toString());
  // //     secondName = value.data["name"];
  // //     tempSecondMainWeather = value.data["main"]["temp"];
  // //     minSecondTempMainWeather = value.data["main"]["temp_min"];
  // //     maxSecondTempMainWeather = value.data["main"]["temp_max"];
  // //     feelsLikeSecondTempMainWeather = value.data["main"]["feels_like"];
  // //     windSpeedSecondMainWeather = value.data["wind"]["speed"];
  // //     humiditySecondTempMainWeather = value.data["main"]["humidity"];
  // //     sysSecondWeather = value.data["sys"];
  // //     weatherSecondDescription = value.data["weather"][0]["description"];
  // //     // debugPrint(feelsLikeTempMainWeather.toString());
  // //     // debugPrint(sysWeather!.toString());
  // //     // debugPrint(name);
  // //     // debugPrint(weatherDescription.toString());
  // //
  // //
  // //     emit(AppGetWeatherSuccessState());
  // //   }).catchError((error){
  // //     debugPrint(error.toString());
  // //     emit(AppGetWeatherErrorState(error.toString()));
  // //   });
  // //
  // // }
  //
  //
  // List<Widget> screens = [
  //   const WeatherHomepageWidget(),
  //   const WeatherFirstPageWidget(),
  // ];
  //
  //
  //
  // double? searchMainWeather;
  // String? searchName;
  // String? weatherSearchDescription;

  // void getSearchResult(String city,) {
  //   emit(AppSearchLoadingState());
  //   DioHelper.getData(
  //     url: 'data/2.5/weather',
  //     query: {
  //       'q': city,
  //       'appid': 'bd75fac350c7af7ef1d122cb96a7646d',
  //       'units': 'metric'
  //     },).then((value) {
  //     searchName = value.data["name"];
  //     weatherSearchDescription = value.data["weather"][0]["description"];
  //     searchMainWeather = value.data["main"]["temp"];
  //     debugPrint(searchName);
  //     emit(AppSearchWeatherSuccessState());
  //   }).catchError((error) {
  //     debugPrint(error.toString());
  //     emit(AppSearchWeatherErrorState(error));
  //   });
  // }




  TextEditingController searchController = TextEditingController();
  CurrentWeatherModel? currentWeatherModel;
  // List<Map<String, dynamic>> weather = [];
  void getCurrentWeather(String city) async {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.weatherapi.com',
        receiveDataWhenStatusError: true,
      ),
    );
    emit(AppGetWeatherLoadingState());

    Response currentWeatherResponse = await DioHelper.getData(
      url: forecast,
      query: {
        'key':'d08fd1a3fa2349fd84d173356220509',
        'q':city,
        'days':'1',
        'aqi':'no',
        'alerts':'no',
      });
    emit(AppGetWeatherSuccessState());
    debugPrint('------------------');
    currentWeatherModel = CurrentWeatherModel.fromJson(currentWeatherResponse.data,);
    debugPrint(currentWeatherModel!.location.name);
    debugPrint(currentWeatherModel!.current.tempC.toString());
    debugPrint(currentWeatherModel!.current.condition);
    debugPrint(currentWeatherModel!.current.humidity.toString());
    debugPrint(currentWeatherModel!.forecast.forecastday);
    debugPrint(currentWeatherModel!.forecast.maxtemp_c.toString());
    debugPrint(currentWeatherModel!.forecast.mintemp_c.toString());
    debugPrint(currentWeatherModel!.forecast.sunrise);
    debugPrint(currentWeatherModel!.forecast.sunset);
    debugPrint(currentWeatherModel!.location.localtime);

  }

  SearchModel? searchModel;
  void getSearchWeather(String city) async {
    emit(AppSearchLoadingState());
    Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.weatherapi.com',
        receiveDataWhenStatusError: true,
      ),
    );


    Response currentSearchResponse = await DioHelper.getData(
        url: forecast,
        query: {
          'key':'d08fd1a3fa2349fd84d173356220509',
          'q': city,
          'days':'1',
          'aqi':'no',
          'alerts':'no',
        });
    emit(AppSearchWeatherSuccessState());
    debugPrint('------------------');
    searchModel = SearchModel.fromJson(currentSearchResponse.data,);
    // debugPrint(searchModel!.location.name);
    // debugPrint(searchModel!.current.tempC.toString());
    // debugPrint(searchModel!.current.condition);
    // debugPrint(searchModel!.forecast.forecastday);
    // debugPrint(searchModel!.forecast.maxtemp_c.toString());
    // debugPrint(searchModel!.forecast.mintemp_c.toString());
    // debugPrint(searchModel!.forecast.sunrise);
    // debugPrint(searchModel!.forecast.sunset);
    // debugPrint(searchModel!.forecast.forecastday);
    // debugPrint(searchModel!.forecast.day2.toString());

  }

  TextEditingController homeCountryController = TextEditingController();
  TextEditingController favoriteCountryController = TextEditingController();
  FavoriteCityModel? favoriteModel;
  void getFavoriteCityWeather(String city) async {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.weatherapi.com',
        receiveDataWhenStatusError: true,
      ),
    );
    emit(AppFavoriteLoadingState());

    Response favoriteCityResponse = await DioHelper.getData(
        url: forecast,
        query: {
          'key':'d08fd1a3fa2349fd84d173356220509',
          'q':city,
          'days':'1',
          'aqi':'no',
          'alerts':'no',
        });
    emit(AppFavoriteWeatherSuccessState());
    debugPrint('------------------');
    favoriteModel = FavoriteCityModel.fromJson(favoriteCityResponse.data,);
    debugPrint(favoriteModel!.location.name);
    debugPrint(favoriteModel!.current.tempC.toString());
    debugPrint(favoriteModel!.current.condition);
    debugPrint(favoriteModel!.current.humidity.toString());
    debugPrint(favoriteModel!.forecast.forecastday);
    debugPrint(favoriteModel!.forecast.maxtemp_c.toString());
    debugPrint(favoriteModel!.forecast.mintemp_c.toString());
    debugPrint(favoriteModel!.forecast.sunrise);
    debugPrint(favoriteModel!.forecast.sunset);
    // // debugPrint(currentWeatherModel!.forecast.day2.toString());

  }

  // late ScrollController scrollController;

}