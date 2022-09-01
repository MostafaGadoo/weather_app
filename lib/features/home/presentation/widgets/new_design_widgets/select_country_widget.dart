import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/utils/blocs/app/cubit.dart';
import 'package:weather_app/core/utils/blocs/app/states.dart';
import 'package:weather_app/features/home/presentation/pages/new_design/weather_home_page.dart';

class SelectCountryWidget extends StatelessWidget {
  const SelectCountryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        AppBloc cubit = AppBloc.get(context);
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(
                //   height: 20,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/maps-location.json'),
                  ],
                ),
                const Text(
                  'Select for your favorite cities',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,

                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0,),
                          ),
                          labelText: 'Search for first the city',
                        ),
                        controller: cubit.firstCountryController,
                        onFieldSubmitted: (value) {
                          // cubit.getWeather(value);
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => const WeatherHomePage(),),);

                          debugPrint(value.toString());
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0,),
                          ),
                          labelText: 'Search for second the city',
                        ),
                        controller: cubit.secondCountryController,
                        onFieldSubmitted: (value) {
                          // cubit.secondGetWeather(value);
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => const WeatherHomePage(),),);

                          debugPrint(value.toString());
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 250,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
