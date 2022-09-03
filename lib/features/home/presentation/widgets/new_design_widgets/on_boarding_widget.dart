import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/network/local/cache_helper.dart';
import 'package:weather_app/features/home/presentation/pages/new_design/select_country_home.dart';
import 'package:weather_app/features/home/presentation/pages/new_design/weather_home_page.dart';
import 'package:weather_app/features/home/presentation/widgets/new_design_widgets/select_country_widget.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Lottie.asset(
                  'assets/weather2.json',
                  width: 300,
                  height: 450,
                )),
          ],
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.0,),
                topLeft: Radius.circular(30.0,),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      bottom: 30,
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                        text: TextSpan(
                      text: 'Find',
                      style: TextStyle(
                        fontSize: 28,
                        color: HexColor('#c2baee'),
                        wordSpacing: 1,
                      ),
                      children: const [
                        TextSpan(
                          text: ' your weather predictions in your city',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            wordSpacing: 1,
                          ),
                        )
                      ]
                    )),
                  ),
                  Text(
                    'Easy steps to predict the weather and make your day easier',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: HexColor('#d2d2de'),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 250,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0,),
                      color: HexColor('#b8adf1'),
                    ),
                    child: MaterialButton(
                      onPressed: (){
                        //WeatherHomePage
                        CacheHelper.saveData(key: 'onBoarding', value: true,)
                            .then((value) {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SelectCountryHome(),),);
                        });
                        // Navigator.pop(context, MaterialPageRoute(builder: (context)=>const SelectCountryHome(),),);
                      },
                      height: 54,
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
