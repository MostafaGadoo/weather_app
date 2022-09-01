import 'package:charcode/html_entity.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather_app/core/utils/blocs/app/cubit.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: HexColor('#2d3741'),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeader(context),
              buildMenuItem(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader(context) => Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
      );

  Widget buildMenuItem(context) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings_rounded,
                  size: 34,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.star_rounded,
                color: Colors.white,
                size: 38,
              ),
              const SizedBox(
                width: 15,
              ),
              const Text(
                'Favorite Location',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.info_outline,
                    color: Colors.white,
                    size: 30,
                  ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 40,
              ),
              const Icon(
                Icons.location_on,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '${AppBloc.get(context).name}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Image(
                width: 20,
                height: 20,
                image: AssetImage(
                  'assets/sunny.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 9,
                      ),
                      child: Text(
                        '${AppBloc.get(context).tempMainWeather}'.split('.').first,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Text(
                      String.fromCharCode($deg),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 10,
            ),
            child: Container(
              width: double.infinity,
              color: Colors.white,
              height: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 15,
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_location_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const Text(
                  'Other Locations',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children:  [
              const SizedBox(
                width: 48.0,
              ),
              Text(
                '${AppBloc.get(context).secondName}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              const Image(
                width: 20,
                height: 20,
                image: AssetImage(
                  'assets/sunny.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 9,
                      ),
                      child: Text(
                        '${AppBloc.get(context).tempSecondMainWeather}'.split('.').first,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Text(
                      String.fromCharCode($deg),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: HexColor('#4f5762'),
              borderRadius: BorderRadius.circular(40),
            ),
            child: MaterialButton(
              height: 42,
              // clipBehavior: Clip.antiAliasWithSaveLayer,
              onPressed: (){},
              child: const Text(
                'Manage Locations',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 10,
            ),
            child: Container(
              width: double.infinity,
              color: Colors.white,
              height: 1,
            ),
          ),
          Row(
            children: const [
              Icon(
                Icons.info_outline,
                color: Colors.white,
                size: 28,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Report Wrong Location',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: const [
              Icon(
                Icons.headset_mic_outlined,
                color: Colors.white,
                size: 28,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Contact US',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ],
      );
}
