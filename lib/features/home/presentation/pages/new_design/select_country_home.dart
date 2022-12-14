import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather_app/core/utils/blocs/app/cubit.dart';
import 'package:weather_app/core/utils/blocs/app/states.dart';
import 'package:weather_app/features/home/presentation/pages/new_design/weather_home_page.dart';
import 'package:weather_app/features/home/presentation/widgets/new_design_widgets/select_country_widget.dart';

class SelectCountryHome extends StatelessWidget {
  const SelectCountryHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      //Container(
      //                   width: 70,
      //                   height: 70,
      //                   decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(50,),
      //                     color: Colors.lightBlueAccent,
      //                   ),
      //                   child: IconButton(
      //                       onPressed: () {
      //                         cubit.getWeather(cubit.firstCountryController.text);
      //                         cubit.secondGetWeather(
      //                             cubit.secondCountryController.text);
      //                         Navigator.push(context, MaterialPageRoute(builder: (
      //                             context) => const WeatherHomePage(),),);
      //                       },
      //                       icon: const Icon(
      //                         Icons.arrow_forward_ios,
      //                         color: Colors.white,
      //                       )),
      //                 ),
      builder: (context, state) {
        AppBloc cubit = AppBloc.get(context);
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              actions: [
                TextButton(
                  onPressed: (){
                    cubit.getWeather(cubit.firstCountryController.text);
                    cubit.secondGetWeather(cubit.secondCountryController.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const WeatherHomePage(),),);
                  },
                  child: const Text(
                  'Next',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                ),),
              ],
            ),
            // backgroundColor: HexColor('#E2EBF3'),
            body: const SelectCountryWidget(),
          ),
        );
      },
    );
  }
}
