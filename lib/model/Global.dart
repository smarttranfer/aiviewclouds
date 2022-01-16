import 'dart:ui';

import 'package:flutter/material.dart';

class Config {
  late PersistentBottomSheetController _controller; // <------ Instance variable
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  // check valueable
  static List<String> CameraList = [];
  static List<String> TitleList = [];
  static List<String> TimeList = [];
  static int timeDruation = 150;
  static bool changelanguge = true;
  static bool changfilter = true;
  static bool shossenface = false;
  static bool shossenscurity = false;
  static bool shossensafe = false;
  static bool chossenEvent = false;

  static bool checkname = false;
  static bool checktimne = false;
  static bool chackcamera = false;

  // Content screen one
  static String Titlevi = "Tổng quan";
  static String Btn1vi = "Khuôn mặt";
  static String Btn2vi = "An toàn";
  static String Btn3vi = "An ninh";
  static String TitleEventvi = "Sự kiện trong ngày";
  static String TitleAction1vi = "  Khuôn mặt";
  static String TitleAction2vi = "  An ninh (Xâm nhập)";
  static String TitleAction3vi = "  An Toàn";
  static String BtnAction1vi = "Người lạ";
  static String BtnAction2vi = "ĐT.nguy hiểm";
  static String BtnAction3vi = "Người quen";
  static String BtnAction4vi = "Lảng vảng";
  static String BtnAction5vi = "Vượt rào";
  static String BtnAction6vi = "Khu vực cấm";
  static String BtnAction7vi = "Người ngủ lâu";
  static String BtnAction8vi = "Người vắng mặt";
  static String BtnAction9vi = "Người ngã";
  static String BtnAction10vi = "Cháy nổ";

  static String Titleen = "Overview";
  static String Btn1en = "Face";
  static String Btn2en = "Safe";
  static String Btn3en = "Security";
  static String TitleEventen = "Event of the day";
  static String TitleAction1en = "  Face";
  static String TitleAction2en = "  Security (Intrusion)";
  static String TitleAction3en = "  Safe";
  static String BtnAction1en = "Stranger";
  static String BtnAction2en = "Dangerous";
  static String BtnAction3en = "Acquaintance";
  static String BtnAction4en = "Prowled";
  static String BtnAction5en = "Hurdles";
  static String BtnAction6en = "The restricted area";
  static String BtnAction7en = "Long sleep";
  static String BtnAction8en = "Absent";
  static String BtnAction9en = "People fall";
  static String BtnAction10en = "Explosion";

  // Content screen two
  static String TitleEventCameravi = "Danh sách sự kiện";
  static String TitleEventCameraen = "List of events";

  static String Contentbtvi = "Hiện thị kết quả";
  static String Contentbten = "show results";

  static String labeChossenNamevi = "Tên bài";
  static String labeChossenNameen = "Article";

  static String labeChossentimevi = "Thời gian";
  static String labeChossentimeen = "Time";

  static String labeChossenCameravi = "Camera";
  static String labeChossenCameraen = "Camera";

  static String labeChossenvi = "Chọn";
  static String labeChossenen = "Choose";

  static String labeNamenvi = "Chọn";
  static String labeNameen = "Choose";

  static String labeTimevi = "12/08/2021 - 12/09/2021";
  static String labeTimeen = "12/08/2021 - 12/09/2021";

  static String labeCameravi = "Camera1,Camera2";
  static String labeCameraen = "Camera1,Camera2";

  static String btnchosseagaintvn = "Đặt lại";
  static String btnchosseagainten = "Reset";

  static String lablefiltervi = "Bộ lọc";
  static String lablefilteren = "Filter";

  static String labelSettingvi = "Cài Đặt";
  static String labelSettingen = "Setting";

  static String labelchangelangugevi = "Ngôn ngữ";
  static String labechangelangugeen = "Languge";

  static String labelBackgroundvi = "Đường dẫn ảnh nền";
  static String labeBackgrounden = "Path image";

  static String labelApplyvi = "Áp Dụng";
  static String labelApplyen = "Apply";

  //man hinh three
  static String areavi = "Khu vực 1";
  static String areaen = "Area";

  static String modelightvi = "Chế độ sáng";
  static String modelighten = "Light mode";
  //config heigh wight
  static double btnheight = 65.0;
  static double btnwight = 65.0;

  static String TitleCamera = "";
  static String contentTitle = "";
  static Color colorschange = Colors.black;
  static String pathTitle = "assets/IconApp/icon_faceReg.svg";
  static Color colorTtile = Colors.black12;
  static bool checkchangevideo = false;
  static String imageBlur =
      "https://images.unsplash.com/photo-1522911715181-6ce196f07c76?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80";
  static String urlenvent =
      "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/9th_may_compressed.mp4?raw=true";
  static String urlenvents =
      "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/9th_may_compressed.mp4?raw=true";

  static bool checkurlenvent = true;

  static String Sumnotifycation(int numbernotify) {
    if (numbernotify > 9999) {
      return "999+";
    } else {
      return numbernotify.toString();
    }
  }

  static String btnreset() {
    if (changelanguge == true) {
      return btnchosseagaintvn;
    } else {
      return btnchosseagainten;
    }
  }

  static List btnresetchossen(chossens) {
    if (chossens == 1) {
      if(TitleList.length>2){

        return [TitleList[0],TitleList[1]];
      }
      return TitleList;
    } else if (chossens == 2) {
      if(TimeList.length>2){
        return [TimeList[0],TimeList[1]];
      }
      return TimeList;
    } else if (chossens == 3) {
      if(CameraList.length>2){
        return[CameraList[0],[CameraList[1]]];
      }
      return CameraList;
    } else {
      return [labeChossenvi];
    }
  }
}
