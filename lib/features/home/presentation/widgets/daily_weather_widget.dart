import 'package:charcode/charcode.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DailyWeatherWidget extends StatelessWidget {
  const DailyWeatherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: HexColor('#84b0df'),
          borderRadius: BorderRadius.circular(15.0,),
          border: Border.all(
            color: HexColor('#92c1f0'),
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Row(
                children: [
                  Text(
                    'Yesterday',
                    style: TextStyle(
                      color: HexColor('#dbe8f6'),
                      fontSize: 22.0,
                    ),
                  ),
                  const Spacer(),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 8.0,
                        ),
                        child: Text(
                          '34',
                          style: TextStyle(
                            color: HexColor('#dbe8f6'),
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Text(
                        String.fromCharCode($deg),
                        style: TextStyle(
                          color: HexColor('#dbe8f6'),
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 8.0,
                        ),
                        child: Text(
                          '24',
                          style: TextStyle(
                            color: HexColor('#dbe8f6'),
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Text(
                        String.fromCharCode($deg),
                        style: TextStyle(
                          color: HexColor('#dbe8f6'),
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Row(
                children: [
                  const Text(
                    'Today',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.water_drop,
                    color: HexColor('#d2e6f6'),
                  ),
                  Text(
                    '0%',
                    style: TextStyle(
                      color: HexColor('#d2e6f6'),
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  const Image(
                    width: 20.0,
                    height: 20.0,
                    image: AssetImage('assets/sunny.png'),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Image(
                    width: 30.0,
                    height: 30.0,
                    image: AssetImage('assets/half-moon.png'),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 8.0,
                        ),
                        child: Text(
                          '34',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Text(
                        String.fromCharCode($deg),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 8.0,
                        ),
                        child: Text(
                          '24',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Text(
                        String.fromCharCode($deg),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Row(
                children: [
                  const Text(
                    'Monday',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.water_drop,
                    color: HexColor('#d2e6f6'),
                  ),
                  Text(
                    '0%',
                    style: TextStyle(
                      color: HexColor('#d2e6f6'),
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  const Image(
                    width: 20.0,
                    height: 20.0,
                    image: AssetImage('assets/sunny.png'),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Image(
                    width: 30.0,
                    height: 30.0,
                    image: AssetImage('assets/half-moon.png'),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 8.0,
                        ),
                        child: Text(
                          '34',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Text(
                        String.fromCharCode($deg),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 8.0,
                        ),
                        child: Text(
                          '24',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Text(
                        String.fromCharCode($deg),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Row(
                children: [
                  const Text(
                    'Tuesday',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.water_drop,
                    color: HexColor('#d2e6f6'),
                  ),
                  Text(
                    '0%',
                    style: TextStyle(
                      color: HexColor('#d2e6f6'),
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  const Image(
                    width: 20.0,
                    height: 20.0,
                    image: AssetImage('assets/sunny.png'),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Image(
                    width: 30.0,
                    height: 30.0,
                    image: AssetImage('assets/half-moon.png'),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 8.0,
                        ),
                        child: Text(
                          '34',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Text(
                        String.fromCharCode($deg),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 8.0,
                        ),
                        child: Text(
                          '24',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Text(
                        String.fromCharCode($deg),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Row(
                children: [
                  const Text(
                    'Wednesday',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.water_drop,
                    color: HexColor('#d2e6f6'),
                  ),
                  Text(
                    '0%',
                    style: TextStyle(
                      color: HexColor('#d2e6f6'),
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  const Image(
                    width: 20.0,
                    height: 20.0,
                    image: AssetImage('assets/sunny.png'),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Image(
                    width: 30.0,
                    height: 30.0,
                    image: AssetImage('assets/half-moon.png'),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 8.0,
                        ),
                        child: Text(
                          '34',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Text(
                        String.fromCharCode($deg),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 8.0,
                        ),
                        child: Text(
                          '24',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Text(
                        String.fromCharCode($deg),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Row(
                children: [
                  const Text(
                    'Thursday',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.water_drop,
                    color: HexColor('#d2e6f6'),
                  ),
                  Text(
                    '0%',
                    style: TextStyle(
                      color: HexColor('#d2e6f6'),
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  const Image(
                    width: 20.0,
                    height: 20.0,
                    image: AssetImage('assets/sunny.png'),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Image(
                    width: 30.0,
                    height: 30.0,
                    image: AssetImage('assets/half-moon.png'),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 8.0,
                        ),
                        child: Text(
                          '34',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Text(
                        String.fromCharCode($deg),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 8.0,
                        ),
                        child: Text(
                          '24',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Text(
                        String.fromCharCode($deg),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Row(
                children: [
                  const Text(
                    'Friday',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.water_drop,
                    color: HexColor('#d2e6f6'),
                  ),
                  Text(
                    '0%',
                    style: TextStyle(
                      color: HexColor('#d2e6f6'),
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  const Image(
                    width: 20.0,
                    height: 20.0,
                    image: AssetImage('assets/sunny.png'),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Image(
                    width: 30.0,
                    height: 30.0,
                    image: AssetImage('assets/half-moon.png'),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 8.0,
                        ),
                        child: Text(
                          '34',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Text(
                        String.fromCharCode($deg),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 8.0,
                        ),
                        child: Text(
                          '24',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Text(
                        String.fromCharCode($deg),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
