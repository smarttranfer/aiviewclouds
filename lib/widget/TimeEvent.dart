import 'package:aiview/page/CameralistEvent.dart';
import "package:flutter/material.dart";

class timeevent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return timeevents();
  }
}

class timeevents extends State<timeevent> {
  @override
  Widget build(BuildContext context) {
    return Listvideo();
  }

  Widget Listvideo() {
    List<Widget> listEvent = [];
    List listtime = [];
    for (int i = 0; i <= 12; i++) {
      listtime.add(i.toString());
    }
    for (var i in listtime) {
      listEvent.add(boxevent(i.toString()));
      listEvent.add(SizedBox(
        width: 20,
      ));
    }
    return Container(
        padding: EdgeInsets.all(8),
        color: Colors.black,
        width: MediaQuery.of(context).size.width / 2,
        height: 35,
        child: ListView(scrollDirection: Axis.horizontal, children: listEvent));
  }

  Widget boxevent(String i) {
    return InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(_createRoute());
        },
        child: Container(
            child: Text(i.toString() + ":00",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ))));
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => CameraViewList(),
  );
}
