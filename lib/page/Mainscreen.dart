import 'dart:io';
import 'dart:ui';
import 'package:page_transition/page_transition.dart';
import 'package:aiview/widgetbutton/BtnAction.dart';
import 'package:aiview/widgetbutton/BtnApply.dart';
import 'package:aiview/widgetbutton/BtnChart.dart';
import 'package:aiview/widgetbutton/BtnCustomShowInfo.dart';
import 'package:aiview/widgetbutton/BtnSetting.dart';
import 'package:aiview/widget/BarSetting.dart';
import 'package:aiview/widget/Weather.dart';
import 'package:aiview/chartview/PiechartView.dart';
import 'package:aiview/model/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'CameralistEvent.dart';

class GetStartedPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FaceWiget();
}

class FaceWiget extends State {
  bool _btnFaceVisi = true;
  bool _btnSaveVisi = false;
  bool _btnSercuVisis = false;
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
        child: Stack(children: <Widget>[
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
              title: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-0.97, -1.02),
                      child: IconButton(
                        icon: SvgPicture.asset('assets/IconApp/icon_user.svg'),
                        onPressed: () {
                          setState(() {
                            showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                      child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black87.withOpacity(0.7),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                    ),
                                    padding: EdgeInsets.only(top: 20),
                                    child: Column(
                                      children: [
                                        BarSetting(
                                          wights: 50,
                                          heights: 100,
                                          path:
                                              "assets/IconApp/closefilter.svg",
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Material(
                                          color:
                                              Colors.black87.withOpacity(0.0),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                Config.changelanguge =
                                                    !Config.changelanguge;
                                              });
                                            },
                                            child: BtnSetting(
                                                chossen: [],
                                                heights: 60,
                                                colors: Colors.grey,
                                                path: "",
                                                labelColor: Colors.white,
                                                labelvi:
                                                    Config.labelchangelangugevi,
                                                labelen:
                                                    Config.labechangelangugeen),
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
                                              setState(() {});
                                            },
                                            child: BtnSetting(
                                                chossen: [],
                                                heights: 60,
                                                colors: Colors.grey,
                                                path: "",
                                                labelColor: Colors.white,
                                                labelvi:
                                                    Config.labelBackgroundvi,
                                                labelen:
                                                    Config.labeBackgrounden),
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
                                                  setState(() {
                                                    print("Apply");
                                                  });
                                                },
                                                child: BtnApply(
                                                  wights: 200,
                                                  heights: 60,
                                                  colors: Colors.orange,
                                                  labelColor: Colors.white,
                                                  ValuelColor: Colors.blue,
                                                )))
                                      ],
                                    ),
                                  )),
                                );
                              },
                            );
                          });
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.05, -0.98),
                      child: Text(
                        Config.changelanguge ? Config.Titlevi : Config.Titleen,
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
                        icon: Icon(
                          Icons.mic,
                          color: Color(0xFFFFFDFD),
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              elevation: 0.0,
            ),
            backgroundColor: const Color(0x4B4B4B).withOpacity(0.0),
            body: SingleChildScrollView(
              child: new BackdropFilter(
                  filter: new ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                  child: Container(
                    child: Column(
                      children: [
                        WeatherCustom(
                          temparature: "32",
                          content: "          Cầu Giấy , Hà Nội",
                          weather: "trời nhiều mây",
                          path: "assets/IconApp/icon_weather.png",
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.35),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: Offset(1.0, 2.0),
                                    blurRadius: 8.0,
                                    spreadRadius: 2.0)
                              ]),
                          child: Column(
                            children: [
                              new SizedBox(
                                height: 10,
                              ),
                              new Text(
                                  Config.changelanguge
                                      ? Config.TitleEventvi
                                      : Config.TitleEventen,
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              new SizedBox(
                                height: 10,
                              ),
                              new Stack(alignment: Alignment.center, children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: new PieCharts(),
                                ),
                                // ),
                                Container(
                                    child: InkWell(
                                  onTap: () {
                                    Navigator.push(context,PageTransition(type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: Config.timeDruation),
                                        reverseDuration: Duration(milliseconds:  Config.timeDruation),child:CameraViewList()));
                                  },
                                  child: new Btnchart(),
                                ))
                              ]),
                              new SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          _btnFaceVisi = true;
                                          _btnSercuVisis = false;
                                          _btnSaveVisi = false;
                                        });
                                      },
                                      child: btnCustomShowInfo(
                                        height: 110,
                                        content: Config.changelanguge
                                            ? Config.Btn1vi
                                            : Config.Btn1en,
                                        path: 'assets/IconApp/icon_user.svg',
                                        wight: 100,
                                        key: null,
                                        colorsGrenze: Colors.red,
                                        color: _btnFaceVisi
                                            ? Colors.white12
                                            : Colors.transparent,
                                        numbers: Config.Sumnotifycation(10),
                                        checks: _btnFaceVisi ? true : false,
                                      )),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          _btnSercuVisis = true;
                                          _btnFaceVisi = false;
                                          _btnSaveVisi = false;
                                        });
                                      },
                                      child: btnCustomShowInfo(
                                        height: 110,
                                        content: Config.changelanguge
                                            ? Config.Btn3vi
                                            : Config.Btn3en,
                                        path:
                                            'assets/IconApp/icon_sercurity.svg',
                                        wight: 100,
                                        key: null,
                                        colorsGrenze: Colors.green,
                                        color: _btnSercuVisis
                                            ? Colors.white12
                                            : Colors.black,
                                        numbers: Config.Sumnotifycation(10000),
                                        checks: _btnSercuVisis ? true : false,
                                      )),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          _btnSaveVisi = true;
                                          _btnSercuVisis = false;
                                          _btnFaceVisi = false;
                                        });
                                      },
                                      child: btnCustomShowInfo(
                                        height: 110,
                                        content: Config.changelanguge
                                            ? Config.Btn2vi
                                            : Config.Btn2en,
                                        path: 'assets/IconApp/icon_safe.svg',
                                        wight: 100,
                                        key: null,
                                        colorsGrenze: Colors.orange,
                                        color: _btnSaveVisi
                                            ? Colors.white12
                                            : Colors.transparent,
                                        numbers: Config.Sumnotifycation(80),
                                        checks: _btnSaveVisi ? true : false,
                                      )),
                                ],
                              ),
                              new SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.values[10],
                              children: [
                                new SizedBox(
                                  height: 20,
                                ),
                                Text(
                                    Config.changelanguge
                                        ? Config.TitleAction1vi
                                        : Config.TitleAction1en,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                new SizedBox(
                                  height: 15,
                                ),
                                GridView.count(
                                  crossAxisCount: 4,
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.all(10.0),
                                  // padding: EdgeInsets.only(left: 24, right: 24),

                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            Config.checkname = true;
                                            Config.labeNamenvi =
                                                Config.BtnAction3vi;
                                            Navigator.push(context,PageTransition(type: PageTransitionType.rightToLeft,duration: Duration(milliseconds:  Config.timeDruation),
                                                reverseDuration: Duration(milliseconds:  Config.timeDruation),child:CameraViewList()));
                                          });
                                        },
                                        child: btnAction(
                                          heights: Config.btnheight,
                                          wights: Config.btnheight,
                                          path:
                                              "assets/IconApp/icon_faceReg.svg",
                                          content: "",
                                          colors: Colors.lightGreen,
                                          numbernotifi: "1200",
                                          colorsnotify: Colors.redAccent,
                                          namebtn: Config.changelanguge
                                              ? Config.BtnAction3vi
                                              : Config.BtnAction3en,
                                        )),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            Config.checktimne = true;
                                            Config.labeNamenvi =
                                                Config.BtnAction2vi;
                                            Navigator.push(context,PageTransition(type: PageTransitionType.rightToLeft,duration: Duration(milliseconds:  Config.timeDruation),
                                                reverseDuration: Duration(milliseconds:  Config.timeDruation),child:CameraViewList()));
                                          });
                                        },
                                        child: btnAction(
                                          heights: Config.btnheight,
                                          wights: Config.btnheight,
                                          path:
                                              "assets/IconApp/icon_faceReg.svg",
                                          content: "",
                                          colors: Colors.red,
                                          numbernotifi: "1000",
                                          colorsnotify: Colors.redAccent,
                                          namebtn: Config.changelanguge
                                              ? Config.BtnAction2vi
                                              : Config.BtnAction2en,
                                        )),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            Config.chackcamera = true;
                                            Config.labeNamenvi =
                                                Config.BtnAction1vi;
                                            Navigator.push(context,PageTransition(type: PageTransitionType.rightToLeft,duration: Duration(milliseconds:  Config.timeDruation),
                                                reverseDuration: Duration(milliseconds:  Config.timeDruation),child:CameraViewList()));
                                                // _createRoute());
                                          });
                                        },
                                        child: btnAction(
                                          heights: Config.btnheight,
                                          wights: Config.btnheight,
                                          path:
                                              "assets/IconApp/icon_faceReg.svg",
                                          content: "",
                                          colors: Colors.orangeAccent,
                                          numbernotifi: "400",
                                          colorsnotify: Colors.redAccent,
                                          namebtn: Config.changelanguge
                                              ? Config.BtnAction1vi
                                              : Config.BtnAction1en,
                                        )),
                                  ],
                                ),
                                new SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          visible: _btnFaceVisi,
                        ),
                        Visibility(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.values[10],
                              children: [
                                new SizedBox(
                                  height: 20,
                                ),
                                Text(
                                    Config.changelanguge
                                        ? Config.TitleAction2vi
                                        : Config.TitleAction2en,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                new SizedBox(
                                  height: 15,
                                ),
                                GridView.count(
                                  padding: const EdgeInsets.all(10.0),
                                  crossAxisCount: 4,
                                  shrinkWrap: true,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            Config.checktimne = true;
                                            Config.labeNamenvi =
                                                Config.BtnAction2vi;
                                            Navigator.push(context,PageTransition(type: PageTransitionType.rightToLeft,duration: Duration(milliseconds:  Config.timeDruation),
                                                reverseDuration: Duration(milliseconds:  Config.timeDruation),child:CameraViewList()));
                                            // _btnFaceVisi = !_btnFaceVisi;
                                            // _btnSercuVisis = true;
                                            // _btnSaveVisi = true;
                                          });
                                        },
                                        child: btnAction(
                                          heights: Config.btnheight,
                                          wights: Config.btnheight,
                                          path: "assets/IconApp/langvang.svg",
                                          content: "",
                                          colors: Colors.blue,
                                          numbernotifi: "400",
                                          colorsnotify: Colors.redAccent,
                                          namebtn: Config.changelanguge
                                              ? Config.BtnAction4vi
                                              : Config.BtnAction4en,
                                        )),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            Config.checktimne = true;
                                            Config.labeNamenvi =
                                                Config.BtnAction2vi;
                                            Navigator.push(context,PageTransition(type: PageTransitionType.rightToLeft,duration: Duration(milliseconds:  Config.timeDruation),
                                                reverseDuration: Duration(milliseconds:  Config.timeDruation),child:CameraViewList()));
                                            // _btnSaveVisi = !_btnSaveVisi;
                                            // _btnSercuVisis = true;
                                            // _btnFaceVisi = true;
                                          });
                                        },
                                        child: btnAction(
                                          heights: Config.btnheight,
                                          wights: Config.btnheight,
                                          path: "assets/IconApp/Vuotrao.svg",
                                          content: "",
                                          colors: Colors.greenAccent,
                                          numbernotifi: "1000",
                                          colorsnotify: Colors.redAccent,
                                          namebtn: Config.changelanguge
                                              ? Config.BtnAction5vi
                                              : Config.BtnAction5en,
                                        )),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            Config.checktimne = true;
                                            Config.labeNamenvi =
                                                Config.BtnAction2vi;
                                            Navigator.push(context,PageTransition(type: PageTransitionType.rightToLeft,duration: Duration(milliseconds:  Config.timeDruation),
                                                reverseDuration: Duration(milliseconds:  Config.timeDruation),child:CameraViewList()));
                                            // _btnSercuVisis = !_btnSercuVisis;
                                            // _btnFaceVisi = true;
                                            // _btnSaveVisi = true;
                                          });
                                        },
                                        child: btnAction(
                                          heights: Config.btnheight,
                                          wights: Config.btnheight,
                                          path:
                                              "assets/IconApp/Vaokhuvuccam.svg",
                                          content: "",
                                          colors: Colors.lightBlue,
                                          numbernotifi: "1200",
                                          colorsnotify: Colors.redAccent,
                                          namebtn: Config.changelanguge
                                              ? Config.BtnAction6vi
                                              : Config.BtnAction6en,
                                        )),
                                  ],
                                ),
                                new SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          visible: _btnSaveVisi,
                        ),
                        Visibility(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.values[10],
                              children: [
                                new SizedBox(
                                  height: 20,
                                ),
                                Text(
                                    Config.changelanguge
                                        ? Config.TitleAction3vi
                                        : Config.TitleAction3en,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                new SizedBox(
                                  height: 15,
                                ),
                                GridView.count(
                                  padding: const EdgeInsets.all(10.0),
                                  crossAxisCount: 4,
                                  shrinkWrap: true,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            Config.checktimne = true;
                                            Config.labeNamenvi =
                                                Config.BtnAction2vi;
                                            Navigator.push(context,PageTransition(type: PageTransitionType.rightToLeft,duration: Duration(milliseconds:  Config.timeDruation),
                                                reverseDuration: Duration(milliseconds:  Config.timeDruation),child:CameraViewList()));
                                            // _btnFaceVisi = !_btnFaceVisi;
                                            // _btnSercuVisis = true;
                                            // _btnSaveVisi = true;
                                          });
                                        },
                                        child: btnAction(
                                          heights: Config.btnheight,
                                          wights: Config.btnwight,
                                          path:
                                              "assets/IconApp/NguoiNguLau.svg",
                                          content: "",
                                          colors: Colors.blueGrey,
                                          numbernotifi: "400",
                                          colorsnotify: Colors.redAccent,
                                          namebtn: Config.changelanguge
                                              ? Config.BtnAction7vi
                                              : Config.BtnAction7en,
                                        )),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            Config.checktimne = true;
                                            Config.labeNamenvi =
                                                Config.BtnAction2vi;
                                            Navigator.push(context,PageTransition(type: PageTransitionType.rightToLeft,duration: Duration(milliseconds:  Config.timeDruation),
                                                reverseDuration: Duration(milliseconds:  Config.timeDruation),child:CameraViewList()));
                                            // _btnSaveVisi = !_btnSaveVisi;
                                            // _btnSercuVisis = true;
                                            // _btnFaceVisi = true;
                                          });
                                        },
                                        child: btnAction(
                                          heights: Config.btnheight,
                                          wights: Config.btnheight,
                                          path:
                                              "assets/IconApp/NguoiVangMat.svg",
                                          content: "",
                                          colors: Colors.purple,
                                          numbernotifi: "1000",
                                          colorsnotify: Colors.redAccent,
                                          namebtn: Config.changelanguge
                                              ? Config.BtnAction8vi
                                              : Config.BtnAction8en,
                                        )),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            Config.checktimne = true;
                                            Config.labeNamenvi =
                                                Config.BtnAction2vi;
                                            Navigator.push(context,PageTransition(type: PageTransitionType.rightToLeft,duration: Duration(milliseconds:  Config.timeDruation),
                                                reverseDuration: Duration(milliseconds:  Config.timeDruation),child:CameraViewList()));
                                            // _btnSercuVisis = !_btnSercuVisis;
                                            // _btnFaceVisi = true;
                                            // _btnSaveVisi = true;
                                          });
                                        },
                                        child: btnAction(
                                          heights: Config.btnheight,
                                          wights: Config.btnheight,
                                          path: "assets/IconApp/NguoiNga.svg",
                                          content: "",
                                          colors: Colors.brown,
                                          numbernotifi: "1200",
                                          colorsnotify: Colors.redAccent,
                                          namebtn: Config.changelanguge
                                              ? Config.BtnAction9vi
                                              : Config.BtnAction9en,
                                        )),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            Config.checktimne = true;
                                            Config.labeNamenvi =
                                                Config.BtnAction2vi;
                                            Navigator.push(context,PageTransition(type: PageTransitionType.rightToLeft,duration: Duration(milliseconds:  Config.timeDruation),
                                                reverseDuration: Duration(milliseconds:  Config.timeDruation),child:CameraViewList()));
                                            // _btnSercuVisis = !_btnSercuVisis;
                                            // _btnFaceVisi = true;
                                            // _btnSaveVisi = true;
                                          });
                                        },
                                        child: btnAction(
                                          heights: Config.btnheight,
                                          wights: Config.btnheight,
                                          path: "assets/IconApp/ChayNo.svg",
                                          content: "",
                                          colors: Colors.redAccent,
                                          numbernotifi: "1200",
                                          colorsnotify: Colors.redAccent,
                                          namebtn: Config.changelanguge
                                              ? Config.BtnAction10vi
                                              : Config.BtnAction10en,
                                        )),
                                  ],
                                ),
                                new SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          visible: _btnSercuVisis,
                        ),
                      ],
                    ),
                  )),
            ),
          ),
          // IgnorePointer(child: AnimationScreen(color: Color(0x404447)))
        ]));
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => CameraViewList(),
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
