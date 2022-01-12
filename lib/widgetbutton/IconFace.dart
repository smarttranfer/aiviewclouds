import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart';

class IconFace extends StatelessWidget {
  const IconFace({
    required this.colors,
    required this.path,
    required this.numbernotifi,
    required this.colorsnotify,
    required this.heights,
    required this.wights,
    required this.namebtn,
    Key? key,
  }) : super(key: key);
  final Color colors;
  final String path;
  final String numbernotifi;
  final Color colorsnotify;
  final double heights;
  final double wights;
  final String namebtn;

  @override
  Widget build(BuildContext context) {
    return Container(
        child:
        Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SizedBox(
            height: heights,
            width: wights,
            child: Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colors,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Container(
                    child: Center(
                      child: SvgPicture.asset(path),
                    ))),
          ),
        ]));
  }
}
