import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class btnCustomShowInfo extends StatelessWidget {
  const btnCustomShowInfo(
      {Key? key,
      required this.wight,
      required this.height,
      required this.path,
      required this.content,
      required this.colorsGrenze,
      required this.numbers,
      required this.color,
      required this.checks})
      : super(key: key);
  final double wight;
  final double height;
  final String path;
  final String content;
  final Color color;
  final Color colorsGrenze;
  final String numbers;
  final bool checks;

  @override
  Widget build(BuildContext context) {
    bool checkPress = checks;
    return SizedBox(
        height: height,
        width: wight,
        child: Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color:
                  checkPress ? color.withOpacity(0.2) : color.withOpacity(0.0),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: SvgPicture.asset(path),
                            height: 15,
                            width: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 5,
                              )
                            ],
                          ),
                          Text(content,
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white)),
                        ]),
                    Row(
                      children: [
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: colorsGrenze,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          height: 3,
                          width: 70,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          numbers,
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ],
            )));
  }
}
