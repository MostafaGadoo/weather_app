import 'package:charcode/charcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/utils/blocs/app/cubit.dart';
import 'package:weather_app/core/utils/blocs/app/states.dart';
import 'package:weather_app/features/home/presentation/widgets/new_design_widgets/search_item.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
      listener: (context, state) {
        if(state is AppSearchLoadingState){
          Container(
            child: Lottie.asset('assets/searching.json'),
          );
        }
      },
      builder: (context, state) {
        AppBloc cubit = AppBloc.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            cubit.searchName == null ? Container(
              child: Lottie.asset('assets/searching.json'),
            ):Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0,),
                color: Colors.yellowAccent[100],
              ),
              child:Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${cubit.searchName}',
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '${cubit.weatherSearchDescription}',
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 14.0,
                          ),
                          child: Text(
                            '${cubit.searchMainWeather}'.split('.').first,
                            style: TextStyle(
                              color: HexColor('#444f6b'),
                              fontSize: 50,
                            ),
                          ),
                        ),
                        Text(
                          String.fromCharCode($deg),
                          style: TextStyle(
                            color: HexColor('#444f6b'),
                            fontSize: 42.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
