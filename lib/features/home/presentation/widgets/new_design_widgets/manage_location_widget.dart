import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/blocs/app/cubit.dart';
import 'package:weather_app/core/utils/blocs/app/states.dart';

class ManageLocationWidget extends StatelessWidget {
  const ManageLocationWidget({Key? key}) : super(key: key);

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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Image(
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.fill,
                  image: AssetImage('assets/Location.jpg'),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Change your home city:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0,),
                    ),
                    labelText: 'Change your home city',
                  ),
                  controller: cubit.homeCountryController,
                  onFieldSubmitted: (value) {
                    cubit.getCurrentWeather(cubit.homeCountryController.text);
                    debugPrint(value.toString());
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  'Change your favorite city:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0,),
                    ),
                    labelText: 'Change your favorite city',
                  ),
                  controller: cubit.favoriteCountryController,
                  onFieldSubmitted: (value) {
                    cubit.getFavoriteCityWeather(cubit.favoriteCountryController.text);
                    debugPrint(value.toString());
                  },
                ),
                const SizedBox(
                  height: 200,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      onPressed: (){
                        cubit.getCurrentWeather(cubit.homeCountryController.text);
                        cubit.getFavoriteCityWeather(cubit.favoriteCountryController.text);
                        Navigator.pop(context);
                      },
                      child: const Icon(
                      Icons.arrow_forward,
                    ),),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
