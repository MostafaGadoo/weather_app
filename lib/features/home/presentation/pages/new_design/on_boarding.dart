import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather_app/features/home/presentation/widgets/new_design_widgets/on_boarding_widget.dart';

class OnBoardingHomeScreen extends StatelessWidget {
  const OnBoardingHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('#E2EBF3'),
        body: const OnBoardingWidget(),
      ),
    );
  }
}
