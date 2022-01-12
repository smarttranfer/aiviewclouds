import 'dart:io';

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
  bool checkinet = false;
  @override
  Widget build(BuildContext context) {
    return Listvideo();
  }

  @override
  void initState() {
    if (checkping() == true) {
      setState(() {
        checkinet = true;
      });
    }
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
                child: checkinet
                    ? Image.network(
                        "https://images.unsplash.com/photo-1516804111857-ff7e2e566d4b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176&q=80",
                        width: MediaQuery.of(context).size.width / 3.5,
                      )
                    : Image.asset(
                        "assets/icondrawer/noimage.jpg",
                        width: MediaQuery.of(context).size.width / 3.5,
                      ))));
  }
}

Future<bool> checkping() async {
  final result = await InternetAddress.lookup('google.com');
  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    return true;
  }
  return false;
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => CameraViewList(),
  );
}
