import 'dart:io';
import 'dart:ui';
import 'package:aiview/playvideo/ActionVideo.dart';
import 'package:aiview/widget/BoxView.dart';
import 'package:aiview/widget/SmallEvent.dart';
import 'package:aiview/model/ModelCamera.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:aiview/widgetbutton/BtnactionEvent.dart';
import 'package:aiview/model/Global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VideoDetail extends StatefulWidget {
  const VideoDetail({
    Key? key,
    YoutubeModel,
    detail,
  }) : super(key: key);

  @override
  _VideoDetailState createState() => _VideoDetailState();
}

class _VideoDetailState extends State<VideoDetail> {
  bool checkping = false;
  bool _visible = true;
  bool _visibles = true;
  Future<bool> checkpings() async {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    if (checkpings() == true) {
      setState(() {
        checkping = true;
      });
    }
    SamplePlayer(
      key: null,
    );
    Future.delayed(const Duration(seconds: 7), () {
      if (this.mounted) {
        setState(() {
          _visible = false;
        });
      }
    });
    Future.delayed(const Duration(seconds: 8), () {
      if (this.mounted) {
        setState(() {
          _visibles = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    // _controller.dispose();
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: Config.TitleCamera,
        text: Config.contentTitle,
        linkUrl: Config.urlenvent,
        chooserTitle: Config.TitleCamera);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _layouts = [
      _channelInfo(),
      _moreInfo(),
      Listvideo(context),
    ];

    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      _layouts.clear();
    }

    return new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 25, sigmaY: 25),
        child: Scaffold(
            backgroundColor: Color(0x404447),
            body: Column(
              children: <Widget>[
                _buildVideoPlayer(context),
                SizedBox(
                    height: 8,
                    child: Container(
                      color: Colors.black38,
                    )),
                Visibility(
                  child: Expanded(
                    child: Visibility(
                      child: ListView(
                        children: _layouts,
                      ), //Your widget is gone and won't take up space
                      visible: true,
                    ),
                  ),
                  visible: true,
                )
              ],
            )));
  }

  Widget _buildVideoPlayer(BuildContext context) {
    return Container(
      margin: new EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          bottom: MediaQuery.of(context).padding.bottom),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? 200.0
          : MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://irishacademy.ie/wp-content/uploads/2017/09/404-error-banner-2.jpg"),
              fit: BoxFit.cover)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: InkWell(
              child: SamplePlayer(
                key: null,
              ),
            ),
          ),
          Center(
            child: Column(children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          spreadRadius: 0.1,
                          blurRadius: 55, // changes position of shadow
                        ),
                      ],
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Visibility(
                        visible: true,
                        child: IconButton(
                          icon: SvgPicture.asset("assets/IconApp/live.svg"),
                          color: Color(0xFFFFFDFD),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width -
                        (MediaQuery.of(context).size.width / 2.7),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          spreadRadius: 0.1,
                          blurRadius: 55, // changes position of shadow
                        ),
                      ],
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: SvgPicture.asset("assets/IconApp/share.svg"),
                        color: Color(0xFFFFFDFD),
                        onPressed: () {
                          share();
                        },
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          spreadRadius: 0.1,
                          blurRadius: 55,
                          // changes position of shadow
                        ),
                      ],
                    ),
                    child: Align(
                      // alignment: Alignment.topRight,
                      child: IconButton(
                        icon: SvgPicture.asset("assets/IconApp/fullscreen.svg"),
                        color: Color(0xFFFFFDFD),
                        onPressed: () {
                          setState(() {
                            _visible = !_visible;
                            _visibles = !_visibles;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
              Container(
                  margin: EdgeInsets.only(top: 70, bottom: 2),
                  child: AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 700),
                    child: Visibility(child: smallevent(), visible: _visibles),
                  ))
            ]),
          )
        ],
      ),
    );
  }

  Widget _channelInfo() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black38,
      ),
      child: Row(
        children: <Widget>[
          BtnactionEvent(
            heights: 90,
            wights: 90,
            path: Config.pathTitle,
            colors: Config.colorTtile,
            numbernotifi: "400",
            colorsnotify: Colors.black38,
            namebtn: Config.changelanguge
                ? Config.BtnAction4vi
                : Config.BtnAction4en,
          ),
          Expanded(
            child: ListTile(
              title: Text(
                Config.TitleCamera,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              subtitle: Text(Config.contentTitle,
                  style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _moreInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Expanded(
              child: Text(
                  Config.changelanguge
                      ? Config.areavi + "(" + listData.length.toString() + ")"
                      : Config.areaen + "(" + listData.length.toString() + ")",
                  style: TextStyle(fontSize: 20, color: Colors.white))),
        ],
      ),
    );
  }

  Widget Listvideo(BuildContext context) {
    List<Widget> lists = [];
    String titles = "";
    int k = 1;
    for (var i in listData) {
      if (i.title.length > 20) {
        titles = i.title.substring(0, 20).toString() + "...";
      } else {
        titles = i.title;
      }
      if (Config.shossenface == true) {
        setState(() {
          Config.TitleCamera = i.title;
          Config.contentTitle = i.title.toString() + "\n" + i.time.toString();
          Config.colorTtile = i.color;
        });
        if (k % 19 == 0 && k > 0) {
          lists.add(new Boxvideo(
            checklist: k,
            colors: i.color,
            path: i.channelAvatar,
            subtitleEvent: i.time,
            titleEvent: titles,
            link: i.imageEvent,
            checkping: checkping,
          ));
          lists.add(new SizedBox(
            height: 60,
          ));
        } else {
          lists.add(new Boxvideo(
            checklist: k,
            colors: i.color,
            path: i.channelAvatar,
            subtitleEvent: i.time,
            titleEvent: titles,
            link: i.imageEvent,
            checkping: checkping,
          ));
          lists.add(new SizedBox(
            height: 15,
          ));
        }
      } else if (Config.shossenscurity == true) {
        setState(() {
          Config.TitleCamera = i.title;
          Config.contentTitle = i.title.toString() + "\n" + i.time.toString();
          Config.colorTtile = i.color;
        });
        if (k % 19 == 0 && k > 0) {
          lists.add(new Boxvideo(
            checklist: k,
            colors: i.color,
            path: i.channelAvatar,
            subtitleEvent: i.time,
            titleEvent: titles,
            link: checkping ? i.Events : "assets/icondrawer/noimage.jpg",
            checkping: checkping,
          ));
          lists.add(new SizedBox(
            height: 60,
          ));
        } else {
          lists.add(new Boxvideo(
            checklist: k,
            colors: i.color,
            path: i.channelAvatar,
            subtitleEvent: i.time,
            titleEvent: titles,
            link: checkping ? i.Events : "assets/icondrawer/noimage.jpg",
            checkping: checkping,
          ));
          lists.add(new SizedBox(
            height: 15,
          ));
        }
      } else if (Config.shossensafe == true) {
        setState(() {
          Config.TitleCamera = i.title;
          Config.contentTitle = i.title.toString() + "\n" + i.time.toString();
          Config.colorTtile = i.color;
        });
        if (k % 19 == 0 && k > 0) {
          lists.add(new Boxvideo(
            checklist: k,
            colors: i.color,
            path: i.channelAvatar,
            subtitleEvent: i.time,
            titleEvent: titles,
            link: checkping ? i.Events : "assets/icondrawer/noimage.jpg",
            checkping: checkping,
          ));
          lists.add(new SizedBox(
            height: 60,
          ));
        } else {
          lists.add(new Boxvideo(
            checklist: k,
            colors: i.color,
            path: i.channelAvatar,
            subtitleEvent: i.time,
            titleEvent: titles,
            link: checkping ? i.Events : "assets/icondrawer/noimage.jpg",
            checkping: checkping,
          ));
          lists.add(new SizedBox(
            height: 15,
          ));
        }
      }
      k += 1;
    }
    return SingleChildScrollView(child: Column(children: lists));
  }
}
