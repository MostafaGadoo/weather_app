// import 'package:charcode/charcode.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:weather_app/core/utils/blocs/app/cubit.dart';
// import 'package:weather_app/core/utils/blocs/app/states.dart';
//
// class WeatherFirstPageWidget extends StatelessWidget {
//   const WeatherFirstPageWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AppBloc, AppStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         AppBloc cubit = AppBloc.get(context);
//         return state is AppLoadingState? Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'Please wait we are getting the accurate weather for you.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 22,
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               CircularProgressIndicator(
//                 // backgroundColor: HexColor('#b8adf1'),
//                 color: HexColor('#b8adf1'),
//                 strokeWidth: 5,
//               ),
//             ],
//           ),
//         ) : Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//               Text(
//                 '${cubit.secondName}',
//                 style: TextStyle(
//                   fontSize: 28,
//                   color: HexColor('#596275'),
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 '${cubit.weatherSecondDescription}',
//                 style: TextStyle(
//                   fontSize: 22,
//                   color: HexColor('#596275'),
//                 ),
//               ),
//               const Expanded(
//                 child: Image(
//                   // width: 400.0,
//                   // height: 400.0,
//                   image: AssetImage(
//                     'assets/sunny_weather.png',
//                   ),),
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Stack(
//                     alignment: Alignment.topRight,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           right: 14.0,
//                         ),
//                         child: Text(
//                           '${cubit.tempSecondMainWeather}'.split('.').first,
//                           style: TextStyle(
//                             color: HexColor('#444f6b'),
//                             fontSize: 66,
//                           ),
//                         ),
//                       ),
//                       Text(
//                         String.fromCharCode($deg),
//                         style: TextStyle(
//                           color: HexColor('#444f6b'),
//                           fontSize: 42.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const Spacer(),
//                   Stack(
//                     alignment: Alignment.topRight,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           right: 10.0,
//                         ),
//                         child: Text(
//                           '${cubit.minSecondTempMainWeather}'.split('.').first,
//                           style: TextStyle(
//                             color: HexColor('#444f6b'),
//                             fontSize: 24,
//                           ),
//                         ),
//                       ),
//                       Text(
//                         String.fromCharCode($deg),
//                         style: TextStyle(
//                           color: HexColor('#444f6b'),
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   Stack(
//                     alignment: Alignment.topRight,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           right: 10.0,
//                         ),
//                         child: Text(
//                           '${cubit.maxSecondTempMainWeather}'.split('.').first,
//                           style: TextStyle(
//                             color: HexColor('#a5aab2'),
//                             fontSize: 24,
//                           ),
//                         ),
//                       ),
//                       Text(
//                         String.fromCharCode($deg),
//                         style: TextStyle(
//                           color: HexColor('#a5aab2'),
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   top: 15,
//                 ),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15.0,),
//                     color: Colors.grey[300],
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 15,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'The weather',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: HexColor('#85c6ff'),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         Text(
//                           'feels like',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: HexColor('#85c6ff'),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         Stack(
//                           alignment: Alignment.topRight,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                 right: 10.0,
//                               ),
//                               child: Text(
//                                 '${cubit.feelsLikeSecondTempMainWeather}'.split('.').first,
//                                 style: TextStyle(
//                                   color: HexColor('#444f6b'),
//                                   fontSize: 20,
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               String.fromCharCode($deg),
//                               style: TextStyle(
//                                 color: HexColor('#444f6b'),
//                                 fontSize: 20.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 25.0,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 // decoration: BoxDecoration(
//                 //     color: HexColor('#84b0df'),
//                 //     borderRadius: BorderRadius.circular(15.0,),
//                 //     border: Border.all(
//                 //       color: HexColor('#92c1f0'),
//                 //     )
//                 // ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                     top: 15,
//                     bottom: 15,
//                   ),
//                   child: IntrinsicHeight(
//                     child: Row(
//                       children: [
//                         // Expanded(
//                         //   child: Column(
//                         //     children: [
//                         //       const Image(
//                         //         width: 50.0,
//                         //         height: 50.0,
//                         //         fit: BoxFit.fill,
//                         //         image: AssetImage(
//                         //           'assets/sun.png',
//                         //         ),
//                         //       ),
//                         //       const SizedBox(
//                         //         height: 5,
//                         //       ),
//                         //       Text(
//                         //         'UV index',
//                         //         style: TextStyle(
//                         //           color: HexColor('#6d7382'),
//                         //           fontSize: 20,
//                         //           fontWeight: FontWeight.bold,
//                         //         ),
//                         //       ),
//                         //       const SizedBox(
//                         //         height: 4,
//                         //       ),
//                         //       Text(
//                         //         'High',
//                         //         style: TextStyle(
//                         //           color: HexColor('#6d7382'),
//                         //           fontSize: 18,
//                         //           fontWeight: FontWeight.w400,
//                         //
//                         //         ),
//                         //       ),
//                         //     ],
//                         //   ),
//                         // ),
//                         // const VerticalDivider(
//                         //   color: Colors.black45,
//                         //   thickness: 2,
//                         // ),
//                         Expanded(
//                           child: Column(
//                             children: [
//                               const Image(
//                                 width: 50.0,
//                                 height: 50.0,
//                                 fit: BoxFit.fill,
//                                 image: AssetImage(
//                                   'assets/wind.png',
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 5,
//                               ),
//                               Text(
//                                 'Wind',
//                                 style: TextStyle(
//                                   color: HexColor('#6d7382'),
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 4,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     '${cubit.windSpeedSecondMainWeather}',
//                                     style: TextStyle(
//                                       color: HexColor('#6d7382'),
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w400,
//
//                                     ),
//                                   ),
//                                   Text(
//                                     ' Km/h',
//                                     style: TextStyle(
//                                       color: HexColor('#6d7382'),
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w400,
//
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         const VerticalDivider(
//                           color: Colors.black45,
//                           thickness: 2,
//                         ),
//                         Expanded(
//                           child: Column(
//                             children: [
//                               const Image(
//                                 width: 50.0,
//                                 height: 50.0,
//                                 fit: BoxFit.fill,
//                                 image: AssetImage(
//                                   'assets/humidity.png',
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 5,
//                               ),
//                               Text(
//                                 'Humidity',
//                                 style: TextStyle(
//                                   color: HexColor('#6d7382'),
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 4,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     '${cubit.humiditySecondTempMainWeather}',
//                                     style: TextStyle(
//                                       color: HexColor('#6d7382'),
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w400,
//
//                                     ),
//                                   ),
//                                   Text(
//                                     '%',
//                                     style: TextStyle(
//                                       color: HexColor('#6d7382'),
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w400,
//
//                                     ),
//                                   ),
//                                 ],
//                               ),
//
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
