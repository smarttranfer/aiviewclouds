import 'package:aiview/WidgetButton/IconFace.dart';
import 'package:aiview/model/Global.dart';
import 'package:aiview/model/ModelCamera.dart';
import 'package:aiview/page/CameralistEvent.dart';
import 'package:flutter/material.dart';

class Boxvideo extends StatefulWidget {
  const Boxvideo({
    required this.titleEvent,
    required this.subtitleEvent,
    required this.path,
    required this.colors,
    required this.checklist,
    required this.link,
    Key? key,
  }) : super(key: key);
  final String titleEvent;
  final String subtitleEvent;
  final String path;
  final Color colors;
  final int checklist;
  final String link;

  @override
  State<StatefulWidget> createState() {
    return _DetailVideo();
  }
}

class _DetailVideo extends State<Boxvideo> {
  bool checkchangeColor = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() {
            Config.colorTtile = listData[widget.checklist - 1].color;
            Config.TitleCamera = listData[widget.checklist - 1].title;
            Config.contentTitle = widget.titleEvent;
            Config.urlenvents = listData[widget.checklist - 1].imageEvent;
            checkchangeColor = !checkchangeColor;
          });
          Navigator.of(context).pushReplacement(_createRoute());
        },
        child: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              border: checkchangeColor
                  ? Border.all(color: Colors.black38)
                  : Border.all(color: Colors.white.withOpacity(0.9)),
              color: const Color(0x2B2F33).withOpacity(0.7),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 4), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(left: 2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        widget.link,
                        width: MediaQuery.of(context).size.width / 3.5,
                      ),
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 20,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              IconFace(
                                heights: 40,
                                wights: 40,
                                path: widget.path,
                                colors: widget.colors,
                                numbernotifi: "400",
                                colorsnotify: Colors.black38,
                                namebtn: Config.changelanguge
                                    ? Config.BtnAction4vi
                                    : Config.BtnAction4en,
                              ),
                              Text(
                                widget.titleEvent,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.only(bottom: 5),
                              height: 20,
                              width: MediaQuery.of(context).size.width / 1.8,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: Colors.white,
                                    size: 15.0,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(widget.subtitleEvent,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                ],
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 30,
                ),
              ],
            )));
  }
}

@immutable
class IntegerNotification extends Notification {
  final String Title;
  final String subsTring;
  final Color colors;

  const IntegerNotification(this.Title, this.subsTring, this.colors);
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => CameraViewList(),
  );
}
