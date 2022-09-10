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
      },
      builder: (context, state) {
        AppBloc cubit = AppBloc.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0,),
                color: Colors.white,
              ),
              width: double.infinity,
              height: 65,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0,),
                    ),
                    labelText: 'Search for the city',
                  ),
                  controller: cubit.searchController,
                  onFieldSubmitted: (value){
                    cubit.getSearchWeather(value);
                    cubit.searchController.text = value;
                    debugPrint(value.toString());
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            cubit.searchController.text.isEmpty || state is AppSearchLoadingState ? Container(
                child: Lottie.asset('assets/searching.json'),
            ) :Column(
             children: [
               Text(
                 cubit.searchModel!.location.name,
                 style: const TextStyle(
                   color: Colors.white,
                   fontSize: 24,
                 ),
               ),
               const SizedBox(
                 height: 15.0,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(
                     cubit.searchModel!.forecast.forecastday,
                     style: const TextStyle(
                       color: Colors.white,
                       fontSize: 25,
                       fontWeight: FontWeight.w300,
                     ),
                   ),
                 ],
               ),
               const SizedBox(
                 height: 15.0,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   const Image(
                     width: 70.0,
                     height: 70.0,
                     image: AssetImage('assets/clouds (1).png'),),
                   const SizedBox(
                     width: 10.0,
                   ),
                   Stack(
                     alignment: Alignment.topRight,
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(
                           right: 14.0,
                         ),
                         child: Text(
                           cubit.searchModel!.current.tempC.toString().split('.').first,
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
                           fontWeight: FontWeight.w300,
                         ),
                       ),
                     ],
                   ),
                 ],
               ),
               const SizedBox(
                 height: 15,
               ),
               Row(
                 crossAxisAlignment: CrossAxisAlignment.end,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   const Text(
                       'Min Temp:',
                     style: TextStyle(
                       color: Colors.white,
                     ),
                   ),
                   Stack(
                     alignment: Alignment.topRight,
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(
                           right: 10.0,
                         ),
                         child: Text(
                           cubit.searchModel!.forecast.mintemp_c.toString().split('.').first,
                           style: const TextStyle(
                             color: Colors.white,
                             fontSize: 30,
                             fontWeight: FontWeight.w300,
                           ),
                         ),
                       ),
                       Text(
                         String.fromCharCode($deg),
                         style: const TextStyle(
                           color: Colors.white,
                           fontSize: 24.0,
                           fontWeight: FontWeight.w300,
                         ),
                       ),
                     ],
                   ),

                   const SizedBox(
                     width: 3,
                   ),
                   const Text(
                     '/',
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 22.0,
                     ),
                   ),
                   const SizedBox(
                     width: 5,
                   ),
                   Stack(
                     alignment: Alignment.topRight,
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(
                           right: 10.0,
                         ),
                         child: Text(
                           cubit.searchModel!.forecast.maxtemp_c.toString().split('.').first,
                           style: const TextStyle(
                             color: Colors.white,
                             fontSize: 30,
                             fontWeight: FontWeight.w300,
                           ),
                         ),
                       ),
                       Text(
                         String.fromCharCode($deg),
                         style: const TextStyle(
                           color: Colors.white,
                           fontSize: 24.0,
                           fontWeight: FontWeight.w300,
                         ),
                       ),
                     ],
                   ),
                 ],
               ),
               const SizedBox(
                 height: 15.0,
               ),
               Text(
                 cubit.searchModel!.current.condition,
                 textAlign: TextAlign.center,
                 style: const TextStyle(
                   fontWeight: FontWeight.w200,
                   fontSize: 25,
                   color: Colors.white,
                 ),
               ),

             ],
           ),

           // cubit.searchController.text.isEmpty || state is AppSearchLoadingState ? Container(
           //   child: Lottie.asset('assets/searching.json'),
           // ) :Container(
           //    width: double.infinity,
           //    decoration: BoxDecoration(
           //      borderRadius: BorderRadius.circular(15.0,),
           //      color: Colors.yellowAccent[100],
           //    ),
           //    child:Padding(
           //      padding: const EdgeInsets.all(10.0),
           //      child: Row(
           //        crossAxisAlignment: CrossAxisAlignment.center,
           //        children: [
           //          Column(
           //            crossAxisAlignment: CrossAxisAlignment.start,
           //            children: [
           //              Text(
           //                cubit.searchModel!.location.name,
           //                style: const TextStyle(
           //                  fontSize: 26,
           //                  fontWeight: FontWeight.w600,
           //                ),
           //              ),
           //              const SizedBox(
           //                height: 10.0,
           //              ),
           //              Text(
           //                cubit.searchModel!.current.condition,
           //                style: const TextStyle(
           //                  fontSize: 24,
           //                ),
           //              ),
           //              const SizedBox(
           //                height: 10.0,
           //              ),
           //              Row(
           //                crossAxisAlignment: CrossAxisAlignment.start,
           //                children: [
           //                  const Text(
           //                    'Min Temp:',
           //                    style: TextStyle(
           //                      fontSize: 16,
           //                      fontWeight: FontWeight.bold,
           //                    ),
           //                  ),
           //                  Stack(
           //                    alignment: Alignment.topRight,
           //                    children: [
           //                      Padding(
           //                        padding: const EdgeInsets.only(
           //                          right: 8.0,
           //                        ),
           //                        child: Text(
           //                          cubit.searchModel!.forecast.mintemp_c.toString().split('.').first,
           //                          style: TextStyle(
           //                            color: HexColor('#444f6b'),
           //                            fontSize: 18,
           //                          ),
           //                        ),
           //                      ),
           //                      Text(
           //                        String.fromCharCode($deg),
           //                        style: TextStyle(
           //                          color: HexColor('#444f6b'),
           //                          fontSize: 20.0,
           //                          fontWeight: FontWeight.bold,
           //                        ),
           //                      ),
           //                    ],
           //                  ),
           //                ],
           //              ),
           //            ],
           //          ),
           //
           //          const Spacer(),
           //          Stack(
           //            alignment: Alignment.topRight,
           //            children: [
           //              Padding(
           //                padding: const EdgeInsets.only(
           //                  right: 14.0,
           //                ),
           //                child: Text(
           //                  cubit.searchModel!.current.tempC.toString().split('.').first,
           //                  style: TextStyle(
           //                    color: HexColor('#444f6b'),
           //                    fontSize: 50,
           //                  ),
           //                ),
           //              ),
           //              Text(
           //                String.fromCharCode($deg),
           //                style: TextStyle(
           //                  color: HexColor('#444f6b'),
           //                  fontSize: 42.0,
           //                  fontWeight: FontWeight.bold,
           //                ),
           //              ),
           //            ],
           //          ),
           //        ],
           //      ),
           //    ),
           //  ),
          ],
        );
      },
    );
  }
}
