import 'package:aiview/model/ModelCamera.dart';
import 'package:aiview/page/CameralistEvent.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';

class GiantEvent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return smallevents();
  }
}

class smallevents extends State<GiantEvent> {
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
        height: MediaQuery.of(context).size.width / 10,
        child: Container(

            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.black38.withOpacity(0.2),
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            child: InkWell(
              onTap: (){
                // Navigator.of(context).pushReplacement(_createRoute());
              },
                child:ListView(
                scrollDirection: Axis.horizontal, children: listEvent))));
  }

  Widget boxevent(BuildContext context) {
    bool checkchossen = true;
    return InkWell(
        onTap: () {
          print("chon event");
          // Navigator.of(context).pushReplacement(_createRoute());
        },
        child: Container(
            margin: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color:
                  checkchossen ? Colors.white.withOpacity(0.0) : Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                "https://parade.com/wp-content/uploads/2020/05/nature-quotes.jpg",
                width: MediaQuery.of(context).size.width / 5,
              ),
            )));
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => CameraViewList(),
  );
}
