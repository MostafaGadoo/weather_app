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
                  'Select for your Home City',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0,),
                    ),
                    labelText: 'Search Your home city',
                  ),
                  controller: cubit.homeCountryController,
                  onFieldSubmitted: (value) {
                    cubit.getCurrentWeather(cubit.homeCountryController.text);
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => const WeatherHomePage(),),);
                    debugPrint(value.toString());
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Select for your favorite City',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0,),
                    ),
                    labelText: 'Search Your favorite city',
                  ),
                  controller: cubit.favoriteCountryController,
                  onFieldSubmitted: (value) {
                    cubit.getFavoriteCityWeather(cubit.favoriteCountryController.text);
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => const WeatherHomePage(),),);
                    debugPrint(value.toString());
                  },
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
