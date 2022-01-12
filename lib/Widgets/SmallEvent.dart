import 'package:aiview/model/ModelCamera.dart';
import 'package:aiview/page/CameralistEvent.dart';
import "package:flutter/material.dart";

class smallevent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return smallevents();
  }
}

class smallevents extends State<smallevent> {
  @override
  Widget build(BuildContext context) {
    return Listvideo();
  }

  Widget Listvideo() {
    List<Widget> listEvent = [];
    for (var i in listData) {
      listEvent.add(boxevent(context));
    }
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: ListView(scrollDirection: Axis.horizontal, children: listEvent));
  }

  Widget boxevent(BuildContext context) {
    bool checkchossen = true;
    return InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(_createRoute());
        },
        child: Container(
            margin: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color:
                  checkchossen ? Colors.white.withOpacity(0.0) : Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(3),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                "assets/icondrawer/noimage.jpg",
                width: MediaQuery.of(context).size.width / 3.5,
              ),
            )));
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => CameraViewList(),
  );
}
