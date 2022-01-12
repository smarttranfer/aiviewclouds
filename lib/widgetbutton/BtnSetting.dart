import 'package:aiview/model/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BtnSetting extends StatelessWidget {
  const BtnSetting({
    required this.colors,
    required this.path,
    required this.heights,
    required this.labelColor,
    required this.labelvi,
    required this.labelen,
    required this.chossen,
    Key? key,
  }) : super(key: key);
  final Color colors;
  final String path;
  final double heights;
  final Color labelColor;
  final String labelvi;
  final String labelen;
  final String chossen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: heights,
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            color: colors.withOpacity(0.8),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                      child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      Config.changelanguge ? labelvi : labelen,
                      style: TextStyle(
                          color: labelColor,
                          fontSize: 14,
                          decoration: TextDecoration.none),
                    ),
                  )),
                  Center(
                      child: Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      chossen,
                      style: TextStyle(
                          color: labelColor.withOpacity(0.4),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none),
                    ),
                  ))
                ],
              )
            ],
          ),
        ));
  }
}
