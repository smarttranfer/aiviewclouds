import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart';

class btnAction extends StatelessWidget {
  const btnAction({
    required this.colors,
    required this.content,
    required this.path,
    required this.numbernotifi,
    required this.colorsnotify,
    required this.heights,
    required this.wights,
    required this.namebtn,
    Key? key,
  }) : super(key: key);
  final Color colors;
  final String content;
  final String path;
  final String numbernotifi;
  final Color colorsnotify;
  final double heights;
  final double wights;
  final String namebtn;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Badge(
        toAnimate: true,
        shape: BadgeShape.square,
        animationDuration: Duration(milliseconds: 2),
        badgeColor: colorsnotify,
        borderRadius: BorderRadius.circular(10),
        badgeContent: Text(numbernotifi,
            style: TextStyle(color: Colors.white, fontSize: 10)),
        child: Container(
          height: heights,
          width: wights,
          child: Container(
              // margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colors,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Container(
                  child: Center(
                child: SvgPicture.asset(path),
              ))),
        ),
      ),
      SizedBox(
        height: 10,
        width: 10,
      ),
      Text(
        namebtn,
        style: TextStyle(
            fontSize: 12, color: Colors.white, fontWeight: FontWeight.w600),
      )
    ]));
  }
}
