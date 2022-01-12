import 'package:aiview/model/Global.dart';
import 'package:flutter/material.dart';

class BtnShowFilter extends StatelessWidget {
  const BtnShowFilter({
    required this.colors,
    required this.heights,
    required this.wights,
    required this.labelColor,
    required this.ValuelColor,
    Key? key,
  }) : super(key: key);
  final Color colors;
  final double heights;
  final double wights;
  final Color labelColor;
  final Color ValuelColor;
  @override
  Widget build(BuildContext context) {
    bool checkaction = false;
    return SizedBox(
        height: heights,
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: checkaction ? Colors.blueGrey : colors,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Center(
              child: Text(
            Config.changelanguge ? Config.Contentbtvi : Config.Contentbten,
            style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
          )),
        ));
  }
}
