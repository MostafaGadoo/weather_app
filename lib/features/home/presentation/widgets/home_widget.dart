import 'package:flutter/material.dart';
import 'package:charcode/charcode.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/utils/blocs/app/cubit.dart';
import 'package:weather_app/core/utils/blocs/app/states.dart';
import 'package:weather_app/features/home/presentation/widgets/daily_weather_widget.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            right: 10.0,
                          ),
                          child: Text(
                            '33',
                            style: TextStyle(
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
                        )),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'New Cairo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 38.0,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
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
                              const Padding(
                                padding: EdgeInsets.only(
                                  right: 8.0,
                                ),
                                child: Text(
                                  '34',
                                  style: TextStyle(
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
                              const Padding(
                                padding: EdgeInsets.only(
                                  right: 8.0,
                                ),
                                child: Text(
                                  '24',
                                  style: TextStyle(
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
                              const Padding(
                                padding: EdgeInsets.only(
                                  right: 8.0,
                                ),
                                child: Text(
                                  '34',
                                  style: TextStyle(
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
                        children: const [
                          Text(
                            'Sun,',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            ' 2:55 PM',
                            style: TextStyle(
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
                      color: HexColor('#84b0df'),
                      borderRadius: BorderRadius.circular(15.0,),
                      border: Border.all(
                        color: HexColor('#92c1f0'),
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
                const DailyWeatherWidget(),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: HexColor('#84b0df'),
                      borderRadius: BorderRadius.circular(15.0,),
                      border: Border.all(
                        color: HexColor('#92c1f0'),
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
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                              const Text(
                                '5:25 AM',
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
                                child: Lottie.asset('assets/sunrise.json'),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                'Sunset',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                              const Text(
                                '5:25 PM',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                  width: 100.0,
                                  height: 100.0,
                                  child: Lottie.asset('assets/sunset.json')
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
                      color: HexColor('#84b0df'),
                      borderRadius: BorderRadius.circular(15.0,),
                      border: Border.all(
                        color: HexColor('#92c1f0'),
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
                                  'High',
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
                                Text(
                                  '23 Km/h',
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
                                Text(
                                  '31%',
                                  style: TextStyle(
                                    color: HexColor('#dbe8f6'),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,

                                  ),
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
        );
      },
    );
  }
}
