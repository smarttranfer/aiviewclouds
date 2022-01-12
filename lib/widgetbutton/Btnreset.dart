import 'package:aiview/model/Global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Btnreset extends StatelessWidget {
  const Btnreset({
    required this.heights,
    required this.wights,
    required this.path,
    Key? key,
  }) : super(key: key);
  final double heights;
  final double wights;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: heights,
      // width:  wights,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 90,
          ),
          Center(
            child: Text(
              Config.changelanguge
                  ? Config.lablefiltervi
                  : Config.lablefilteren,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            Config.changelanguge ? "" : Config.btnreset(),
            style: TextStyle(
                fontSize: 14,
                color: Colors.red,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
          ),
          SvgPicture.asset(path)
        ],
      ),
    );
  }
}
