import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather_app/core/utils/blocs/app/cubit.dart';
import 'package:weather_app/core/utils/blocs/app/states.dart';
import 'package:weather_app/features/home/presentation/widgets/home_widget.dart';
import 'package:weather_app/features/home/presentation/widgets/home_widget_scroll.dart';
import 'package:weather_app/features/home/presentation/widgets/new_design_widgets/navigation_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: HexColor('#7db0f1'),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          drawer: const NavigationDrawer(),
          body: const HomeWidgetScroll(),
        );
      },
    );
  }
}
