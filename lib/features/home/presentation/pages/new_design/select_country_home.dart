import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather_app/core/utils/blocs/app/cubit.dart';
import 'package:weather_app/core/utils/blocs/app/states.dart';
import 'package:weather_app/features/home/presentation/pages/home_page.dart';
import 'package:weather_app/features/home/presentation/pages/new_design/weather_home_page.dart';
import 'package:weather_app/features/home/presentation/widgets/home_widget_scroll.dart';
import 'package:weather_app/features/home/presentation/widgets/new_design_widgets/select_country_widget.dart';

class SelectCountryHome extends StatelessWidget {
  const SelectCountryHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        AppBloc cubit = AppBloc.get(context);
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              actions: [
                TextButton(
                  onPressed: (){
                    // cubit.getWeather(cubit.homeCountryController.text);
                    // cubit.secondGetWeather(cubit.secondCountryController.text);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeWidgetScroll(),),);
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeWidgetScroll(),),);
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
