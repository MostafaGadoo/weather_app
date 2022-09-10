import 'package:charcode/charcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/models/current_weather_model.dart';
import 'package:weather_app/core/network/remote/dio_helper.dart';
import 'package:weather_app/core/utils/blocs/app/cubit.dart';
import 'package:weather_app/core/utils/blocs/app/states.dart';
import 'package:weather_app/features/home/presentation/pages/new_design/search_home.dart';
import 'package:weather_app/features/home/presentation/widgets/daily_weather_widget.dart';
import 'package:weather_app/features/home/presentation/widgets/new_design_widgets/navigation_drawer.dart';

class HomeWidgetScroll extends StatefulWidget {
  const HomeWidgetScroll({Key? key}) : super(key: key);

  @override
  State<HomeWidgetScroll> createState() => _HomeWidgetScrollState();
}

class _HomeWidgetScrollState extends State<HomeWidgetScroll> {
  late ScrollController scrollController;

  Color backgroundColor = HexColor('#7db0f1');
  Color widgetColor = HexColor('#84b0df');

  @override
  void initState() {
    // ScrollController scrollController = AppBloc.get(context).scrollController;
    scrollController = ScrollController();
    
    scrollController.addListener(() {
      debugPrint(scrollController.position.pixels.toString());
      if(scrollController.position.pixels > 150){
        setState((){
          backgroundColor = HexColor('#010101');
          widgetColor = HexColor('#171717');
        });
      }else{
        setState((){
          backgroundColor = HexColor('#7db0f1');
          widgetColor = HexColor('#84b0df');
        });
      }
    });
    
    super.initState();
  }
  // final Map<String, dynamic>? map;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        AppBloc cubit = AppBloc.get(context);
        return state is AppGetWeatherLoadingState ? const Center(child: LoadingIndicator(
            indicatorType: Indicator.ballPulse,
            colors: [
              Colors.yellow,
              Colors.orange,
              Colors.red,
            ],
        ),) : Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: backgroundColor,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchHome(),),);
                  cubit.getCurrentWeather(cubit.homeCountryController.text);
                  cubit.getFavoriteCityWeather(cubit.favoriteCountryController.text);
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              // IconButton(
              //   onPressed: () {},
              //   icon: const Icon(
              //     Icons.favorite,
              //     color: Colors.white,
              //   ),
              // ),
            ],
          ),
          drawer: const NavigationDrawer(),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 15.0,
                            ),
                            child: Text(

                              cubit.currentWeatherModel!.current.tempC.toString().split('.').first,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 80,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Text(
                            String.fromCharCode($deg),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 42.0,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                          child: Lottie.asset(
                            'assets/sun.json',
                            width: 100,
                            height: 100.0,
                            animate: true,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        cubit.currentWeatherModel!.location.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 38.0,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      IconButton(
                        onPressed: () {

                        },
                        icon: const Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 40.0,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 8.0,
                                  ),
                                  child: Text(
                                    cubit.currentWeatherModel!.forecast.maxtemp_c.toString().split('.').first,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Text(
                                  String.fromCharCode($deg),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.0,
                              ),
                              child: Text(
                                '/',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 8.0,
                                  ),
                                  child: Text(
                                    cubit.currentWeatherModel!.forecast.mintemp_c.toString().split('.').first,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Text(
                                  String.fromCharCode($deg),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.0,
                              ),
                              child: Text(
                                'Feels Like',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 8.0,
                                  ),
                                  child: Text(
                                    cubit.currentWeatherModel!.current.feelslike_c.toString(). split('.').first,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Text(
                                  String.fromCharCode($deg),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Text(
                              '${cubit.currentWeatherModel!.location.localtime.split(' ').first} ,',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              cubit.currentWeatherModel!.location.localtime.split(' ').last,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: widgetColor,
                        borderRadius: BorderRadius.circular(15.0,),
                        border: Border.all(
                          color: widgetColor,
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Today\'s Temperature',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Expect the same as yesterday',
                            style: TextStyle(
                              color: HexColor('#dbe8f6'),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: widgetColor,
                        borderRadius: BorderRadius.circular(15.0,),
                        border: Border.all(
                          color: widgetColor,
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Yesterday',
                                  style: TextStyle(
                                    color: HexColor('#dbe8f6'),
                                    fontSize: 22.0,
                                  ),
                                ),
                                const Spacer(),
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 8.0,
                                      ),
                                      child: Text(
                                        '34',
                                        style: TextStyle(
                                          color: HexColor('#dbe8f6'),
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      String.fromCharCode($deg),
                                      style: TextStyle(
                                        color: HexColor('#dbe8f6'),
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 8.0,
                                      ),
                                      child: Text(
                                        '24',
                                        style: TextStyle(
                                          color: HexColor('#dbe8f6'),
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      String.fromCharCode($deg),
                                      style: TextStyle(
                                        color: HexColor('#dbe8f6'),
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            child: Row(
                              children: [
                                const Text(
                                  'Today',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                  ),
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.water_drop,
                                  color: HexColor('#d2e6f6'),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      cubit.currentWeatherModel!.current.humidity.toString(),
                                      style: TextStyle(
                                        color: HexColor('#d2e6f6'),
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      '%',
                                      style: TextStyle(
                                        color: HexColor('#d2e6f6'),
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                const Image(
                                  width: 20.0,
                                  height: 20.0,
                                  image: AssetImage('assets/sunny.png'),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                const Image(
                                  width: 30.0,
                                  height: 30.0,
                                  image: AssetImage('assets/half-moon.png'),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 8.0,
                                      ),
                                      child: Text(
                                        cubit.currentWeatherModel!.forecast.mintemp_c.toString().split('.').first,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      String.fromCharCode($deg),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 8.0,
                                      ),
                                      child: Text(
                                        cubit.currentWeatherModel!.forecast.maxtemp_c.toString().split('.').first,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      String.fromCharCode($deg),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            child: Row(
                              children: [
                                const Text(
                                  'Monday',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                  ),
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.water_drop,
                                  color: HexColor('#d2e6f6'),
                                ),
                                Text(
                                  '0%',
                                  style: TextStyle(
                                    color: HexColor('#d2e6f6'),
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                const Image(
                                  width: 20.0,
                                  height: 20.0,
                                  image: AssetImage('assets/sunny.png'),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                const Image(
                                  width: 30.0,
                                  height: 30.0,
                                  image: AssetImage('assets/half-moon.png'),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        right: 8.0,
                                      ),
                                      child: Text(
                                        '34',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      String.fromCharCode($deg),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        right: 8.0,
                                      ),
                                      child: Text(
                                        '24',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      String.fromCharCode($deg),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            child: Row(
                              children: [
                                const Text(
                                  'Tuesday',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                  ),
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.water_drop,
                                  color: HexColor('#d2e6f6'),
                                ),
                                Text(
                                  '0%',
                                  style: TextStyle(
                                    color: HexColor('#d2e6f6'),
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                const Image(
                                  width: 20.0,
                                  height: 20.0,
                                  image: AssetImage('assets/sunny.png'),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                const Image(
                                  width: 30.0,
                                  height: 30.0,
                                  image: AssetImage('assets/half-moon.png'),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        right: 8.0,
                                      ),
                                      child: Text(
                                        '34',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      String.fromCharCode($deg),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        right: 8.0,
                                      ),
                                      child: Text(
                                        '24',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      String.fromCharCode($deg),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            child: Row(
                              children: [
                                const Text(
                                  'Wednesday',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                  ),
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.water_drop,
                                  color: HexColor('#d2e6f6'),
                                ),
                                Text(
                                  '0%',
                                  style: TextStyle(
                                    color: HexColor('#d2e6f6'),
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                const Image(
                                  width: 20.0,
                                  height: 20.0,
                                  image: AssetImage('assets/sunny.png'),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                const Image(
                                  width: 30.0,
                                  height: 30.0,
                                  image: AssetImage('assets/half-moon.png'),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        right: 8.0,
                                      ),
                                      child: Text(
                                        '34',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      String.fromCharCode($deg),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        right: 8.0,
                                      ),
                                      child: Text(
                                        '24',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      String.fromCharCode($deg),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            child: Row(
                              children: [
                                const Text(
                                  'Thursday',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                  ),
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.water_drop,
                                  color: HexColor('#d2e6f6'),
                                ),
                                Text(
                                  '0%',
                                  style: TextStyle(
                                    color: HexColor('#d2e6f6'),
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                const Image(
                                  width: 20.0,
                                  height: 20.0,
                                  image: AssetImage('assets/sunny.png'),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                const Image(
                                  width: 30.0,
                                  height: 30.0,
                                  image: AssetImage('assets/half-moon.png'),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        right: 8.0,
                                      ),
                                      child: Text(
                                        '34',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      String.fromCharCode($deg),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        right: 8.0,
                                      ),
                                      child: Text(
                                        '24',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      String.fromCharCode($deg),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            child: Row(
                              children: [
                                const Text(
                                  'Friday',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                  ),
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.water_drop,
                                  color: HexColor('#d2e6f6'),
                                ),
                                Text(
                                  '0%',
                                  style: TextStyle(
                                    color: HexColor('#d2e6f6'),
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                const Image(
                                  width: 20.0,
                                  height: 20.0,
                                  image: AssetImage('assets/sunny.png'),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                const Image(
                                  width: 30.0,
                                  height: 30.0,
                                  image: AssetImage('assets/half-moon.png'),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        right: 8.0,
                                      ),
                                      child: Text(
                                        '34',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      String.fromCharCode($deg),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        right: 8.0,
                                      ),
                                      child: Text(
                                        '24',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      String.fromCharCode($deg),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: widgetColor,
                        borderRadius: BorderRadius.circular(15.0,),
                        border: Border.all(
                          color: widgetColor,
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 15.0,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                const Text(
                                  'Sunrise',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  cubit.currentWeatherModel!.forecast.sunrise,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 100.0,
                                  height: 100.0,
                                  child: Lottie.asset(
                                    'assets/sunrise.json',
                                    animate: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                const Text(
                                  'Sunset',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  cubit.currentWeatherModel!.forecast.sunset,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  width: 100.0,
                                  height: 100.0,
                                  child: Lottie.asset(
                                    'assets/sunset.json',
                                    animate: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: widgetColor,
                        borderRadius: BorderRadius.circular(15.0,),
                        border: Border.all(
                          color: widgetColor,
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        bottom: 15,
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  const Image(
                                    width: 50.0,
                                    height: 50.0,
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      'assets/sun.png',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'UV index',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    cubit.currentWeatherModel!.current.uv.toString(),
                                    style: TextStyle(
                                      color: HexColor('#dbe8f6'),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,

                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const VerticalDivider(
                              color: Colors.black45,
                              thickness: 2,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  const Image(
                                    width: 50.0,
                                    height: 50.0,
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      'assets/wind.png',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Wind',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        cubit.currentWeatherModel!.current.wind_kph.toString().split('.').first,
                                        style: TextStyle(
                                          color: HexColor('#dbe8f6'),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,

                                        ),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        'Km/h',
                                        style: TextStyle(
                                          color: HexColor('#dbe8f6'),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,

                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const VerticalDivider(
                              color: Colors.black45,
                              thickness: 2,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  const Image(
                                    width: 50.0,
                                    height: 50.0,
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      'assets/humidity.png',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Humidity',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        cubit.currentWeatherModel!.current.humidity.toString(),
                                        style: TextStyle(
                                          color: HexColor('#dbe8f6'),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,

                                        ),
                                      ),
                                      Text(
                                        '%',
                                        style: TextStyle(
                                          color: HexColor('#dbe8f6'),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,

                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
