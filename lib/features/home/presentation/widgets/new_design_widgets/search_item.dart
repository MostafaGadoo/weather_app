import 'package:charcode/charcode.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather_app/core/utils/blocs/app/cubit.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBloc cubit = AppBloc.get(context);
    return Padding(
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
    );
  }
}
