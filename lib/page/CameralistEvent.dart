import 'dart:io';
import 'dart:ui';
import 'package:aiview/widgetbutton/BtnSetting.dart';
import 'package:aiview/widgetbutton/BtnShowFilter.dart';
import 'package:aiview/widgetbutton/Btnreset.dart';
import 'package:aiview/widget/Dialog.dart';
import 'package:aiview/model/Global.dart';
import 'package:aiview/model/ModelCamera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widget/dialogcamera.dart';
import '../widget/dialogtime.dart';
import 'VideoDetail.dart';
import 'package:hexcolor/hexcolor.dart';

class CameraViewList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return cameralist();
  }
}

class cameralist extends State {
  late final List<Evnet> listData;
  bool closedialog = false;
  TextEditingController editingController = TextEditingController();
  bool checkping = false;
  Future<bool> checkpings() async {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
    return false;
  }

  void initState() {
    if (checkpings() == true) {
      setState(() {
        checkping = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 25, sigmaY: 25),
        child: Stack(
          children: [
            checkping
                ? Image.network(
                    Config.imageBlur,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    "assets/background/imageBG.png",
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
            Scaffold(
                appBar: AppBar(
                  backgroundColor: Color(0x404447),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-0.97, -1.02),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.05, -0.98),
                        child: Text(
                          Config.changelanguge
                              ? Config.TitleEventCameravi
                              : Config.TitleEventCameraen,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 25),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.98, -1.01),
                        child: IconButton(
                          icon: SvgPicture.asset("assets/IconApp/Filter.svg"),
                          color: Colors.white,
                          onPressed: () {
                            showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: HexColor("#2B2F33"),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  padding: EdgeInsets.only(top: 20),
                                  child: Column(
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: Btnreset(
                                          wights: 50,
                                          heights: 100,
                                          path:
                                              "assets/IconApp/closefilter.svg",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Material(
                                          color:
                                              Colors.black87.withOpacity(0.0),
                                          child: InkWell(
                                            onTap: () {
                                              showModalBottomSheet(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return SingleChildScrollView(
                                                        child: Container(
                                                            decoration: new BoxDecoration(
                                                                color: HexColor(
                                                                    "#2B2F33")),
                                                            child: Column(
                                                                children: [
                                                                  Container(
                                                                      margin: EdgeInsets.only(
                                                                          top:
                                                                              15,
                                                                          bottom:
                                                                              15),
                                                                      child: Row(
                                                                          children: [
                                                                            IconButton(
                                                                              onPressed: () {
                                                                                Navigator.pop(context);
                                                                              },
                                                                              icon: Icon(
                                                                                Icons.arrow_back_ios,
                                                                                color: Colors.white,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: MediaQuery.of(context).size.width / 4,
                                                                            ),
                                                                            Text(
                                                                              "Tên bài ",
                                                                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                                                                            ),
                                                                          ])),
                                                                  Container(

                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          1.1,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: HexColor(
                                                                            "#404447"),
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                          Radius.circular(
                                                                              15),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          TextField(
                                                                        autofocus:
                                                                            true,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15.0,
                                                                            color:
                                                                                Colors.grey),
                                                                        controller:
                                                                            editingController,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          fillColor:
                                                                              Colors.grey,
                                                                          hintText:
                                                                              "Tìm kiếm",
                                                                          hintStyle: TextStyle(
                                                                              fontSize: 15.0,
                                                                              color: Colors.grey),
                                                                          prefixIcon:
                                                                              Icon(
                                                                            Icons.search,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                          contentPadding: const EdgeInsets.only(
                                                                              left: 14.0,
                                                                              bottom: 8.0,
                                                                              top: 8.0),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: HexColor("#404447")),
                                                                            borderRadius:
                                                                                BorderRadius.circular(25.7),
                                                                          ),
                                                                          enabledBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: HexColor("#404447")),
                                                                            borderRadius:
                                                                                BorderRadius.circular(25.7),
                                                                          ),
                                                                        ),
                                                                      )),
                                                                  Container(
                                                                      margin: EdgeInsets
                                                                          .all(
                                                                          5),
                                                                      height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height,
                                                                      width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width,
                                                                      color: HexColor(
                                                                          "#2B2F33"),
                                                                      child:
                                                                          ListnameEx())
                                                                ])));
                                                  });

                                              setState(() {});
                                            },
                                            child: BtnSetting(
                                                chossen:
                                                    Config.btnresetchossen(1),
                                                heights: 60,
                                                colors: HexColor("#404447"),
                                                path: "",
                                                labelColor: Colors.white,
                                                labelvi:
                                                    Config.labeChossenNamevi,
                                                labelen:
                                                    Config.labeChossenNameen),
                                          )),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Material(
                                        color: Colors.black87.withOpacity(0.0),
                                        child: InkWell(
                                          onTap: () {
                                            showModalBottomSheet(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return SingleChildScrollView(
                                                      child: Container(
                                                          decoration:
                                                              new BoxDecoration(
                                                                  color: HexColor(
                                                                      "#2B2F33")),
                                                          child: Column(
                                                              children: [
                                                                Container(
                                                                    margin: EdgeInsets.only(
                                                                        top: 15,
                                                                        bottom:
                                                                            15),
                                                                    child: Row(
                                                                        children: [
                                                                          IconButton(
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            icon:
                                                                                Icon(
                                                                              Icons.arrow_back_ios,
                                                                              color: Colors.white,
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                MediaQuery.of(context).size.width / 4,
                                                                          ),
                                                                          Text(
                                                                            "Thời gian",
                                                                            style: TextStyle(
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.bold,
                                                                                color: Colors.white),
                                                                          ),
                                                                        ])),
                                                                Container(
                                                                    margin: EdgeInsets
                                                                        .all(
                                                                        5),
                                                                    height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height,
                                                                    width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width,
                                                                    color: HexColor(
                                                                        "#2B2F33"),
                                                                    child:
                                                                        ListnameExtime())
                                                              ])));
                                                });
                                            setState(() {});
                                          },
                                          child: BtnSetting(
                                              chossen: Config.btnresetchossen(2),
                                              heights: 60,
                                              colors: HexColor("#404447"),
                                              path: "",
                                              labelColor: Colors.white,
                                              labelvi: Config.labeChossentimevi,
                                              labelen:
                                                  Config.labeChossentimeen),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Material(
                                          color:
                                              Colors.black87.withOpacity(0.0),
                                          child: InkWell(
                                            onTap: () {
                                              showModalBottomSheet(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return SingleChildScrollView(
                                                        child: Container(
                                                            decoration: new BoxDecoration(
                                                                color: HexColor(
                                                                    "#2B2F33")),
                                                            child: Column(
                                                                children: [
                                                                  Container(
                                                                      margin: EdgeInsets.only(
                                                                          top:
                                                                              15,
                                                                          bottom:
                                                                              15),
                                                                      child: Row(
                                                                          children: [
                                                                            IconButton(
                                                                              onPressed: () {
                                                                                Navigator.pop(context);
                                                                              },
                                                                              icon: Icon(
                                                                                Icons.arrow_back_ios,
                                                                                color: Colors.white,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: MediaQuery.of(context).size.width / 4,
                                                                            ),
                                                                            Text(
                                                                              "Camera",
                                                                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                                                                            ),
                                                                          ])),
                                                                  Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          1.1,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: HexColor(
                                                                            "#404447"),
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                          Radius.circular(
                                                                              15),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          TextField(
                                                                        autofocus:
                                                                            true,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15.0,
                                                                            color:
                                                                                Colors.grey),
                                                                        controller:
                                                                            editingController,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          fillColor:
                                                                              Colors.grey,
                                                                          hintText:
                                                                              "Tìm kiếm",
                                                                          hintStyle: TextStyle(
                                                                              fontSize: 15.0,
                                                                              color: Colors.grey),
                                                                          prefixIcon:
                                                                              Icon(
                                                                            Icons.search,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                          contentPadding: const EdgeInsets.only(
                                                                              left: 14.0,
                                                                              bottom: 8.0,
                                                                              top: 8.0),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: HexColor("#404447")),
                                                                            borderRadius:
                                                                                BorderRadius.circular(25.7),
                                                                          ),
                                                                          enabledBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: HexColor("#404447")),
                                                                            borderRadius:
                                                                                BorderRadius.circular(25.7),
                                                                          ),
                                                                        ),
                                                                      )),
                                                                  Container(
                                                                      margin: EdgeInsets
                                                                          .all(
                                                                          5),
                                                                      height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height,
                                                                      width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width,
                                                                      color: HexColor(
                                                                          "#2B2F33"),
                                                                      child:
                                                                          ListnameExcamera())
                                                                ])));
                                                  });
                                              setState(() {});
                                            },
                                            child: BtnSetting(
                                                chossen:
                                                    Config.btnresetchossen(3),
                                                heights: 60,
                                                colors: HexColor("#404447"),
                                                path: "",
                                                labelColor: Colors.white,
                                                labelvi:
                                                    Config.labeChossenCameravi,
                                                labelen:
                                                    Config.labeChossenCameraen),
                                          )),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Material(
                                          color:
                                              Colors.black87.withOpacity(0.0),
                                          child: InkWell(
                                              onTap: () {
                                                setState(() {});
                                              },
                                              child: BtnShowFilter(
                                                wights: 200,
                                                heights: 60,
                                                colors: Colors.orange,
                                                labelColor: Colors.white,
                                                ValuelColor: Colors.blue,
                                              )))
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                backgroundColor: Color(0x404447).withOpacity(0.0),
                body: Center(child: VideoDetail()))
          ],
        ));
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Dialogs(
      key: null,
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.linear;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
