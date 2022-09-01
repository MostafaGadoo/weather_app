import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weather_app/core/utils/blocs/app/cubit.dart';
import 'package:weather_app/core/utils/blocs/app/states.dart';
import 'package:weather_app/features/home/presentation/pages/new_design/search_home.dart';
import 'package:weather_app/features/home/presentation/widgets/new_design_widgets/navigation_drawer.dart';
import 'package:weather_app/features/home/presentation/widgets/new_design_widgets/weather_home_page.dart';

class WeatherHomePage extends StatelessWidget {
  const WeatherHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return BlocConsumer<AppBloc, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppBloc cubit = AppBloc.get(context);
        return SafeArea(
          child: Scaffold(
            // backgroundColor: HexColor('#C7C7C7'),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const SearchHome(),),);
                  },
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
              ],
            ),
            drawer: const NavigationDrawer(),
            body: Column(
              children: [
                Container(
                  height: 668,
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: pageController,
                      itemBuilder: (context,index)=> cubit.screens[index],
                      itemCount: cubit.screens.length,
                  ),
                ),
                SmoothPageIndicator(
                    controller: pageController,
                    count: cubit.screens.length,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.teal,
                    dotWidth: 10.0,
                    spacing: 5,
                    dotHeight: 10,
                    expansionFactor: 3,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
