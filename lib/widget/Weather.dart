import 'package:flutter/material.dart';

class WeatherCustom extends StatelessWidget {
  const WeatherCustom(
      {Key? key,
      required this.temparature,
      required this.content,
      required this.path,
      required this.weather})
      : super(key: key);
  final String temparature;
  final String path;
  final String content;
  final String weather;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Text(temparature,
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            // SizedBox(width: MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width ),),
            Text("\u2103",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontStyle: FontStyle.normal))
          ],
        ),
        Column(
          children: [
            Text(content,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            //
            Text(weather,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                )),
          ],
        ),
        Image.asset(path),
      ],
    );
  }
}
