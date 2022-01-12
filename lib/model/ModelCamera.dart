import 'dart:ui';

import 'package:aiview/model/ModelCamera.dart';
import 'package:flutter/material.dart';

class Evnet {
  final String title;
  final String description;
  final String time;
  final String channelAvatar;
  final Color color;
  final String imageEvent;
  final String Events;

  Evnet({
    required this.title,
    required this.description,
    required this.time,
    required this.channelAvatar,
    required this.color,
    required this.imageEvent,
    required this.Events,
  });
}

List<Evnet> listData = [
  Evnet(
      title: "Phát hiên đối tượng nguy hiểm",
      description: "Phát hiện người quen",
      time: "19:30:59 - 12/05/2021",
      channelAvatar: "assets/IconApp/iconsmalface.svg",
      imageEvent:
          "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/iceland_compressed.mp4?raw=true",
      color: Colors.red,
      Events:
          "https://parade.com/wp-content/uploads/2020/05/nature-quotes.jpg"),
  Evnet(
      title: "Phát hiện người quen",
      description: "Phát hiện người quen",
      time: "17:30:00 - 12/05/2021",
      channelAvatar: "assets/IconApp/iconsmalface.svg",
      imageEvent:
          "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/iceland_compressed.mp4?raw=true",
      color: Colors.green,
      Events:
          "https://parade.com/wp-content/uploads/2020/05/nature-quotes.jpg"),
  Evnet(
      title: "Phát hiện người lạ",
      description: "Phát hiện người quen",
      time: "3:30:09 - 12/05/2021",
      channelAvatar: "assets/IconApp/iconsmalface.svg",
      imageEvent:
          "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/iceland_compressed.mp4?raw=true",
      color: Colors.orangeAccent,
      Events:
          "https://parade.com/wp-content/uploads/2020/05/nature-quotes.jpg"),
  Evnet(
      title: "Phát hiên đối tượng nguy hiểm",
      description: "Phát hiện người quen",
      time: "22:30:00 - 12/05/2021",
      channelAvatar: "assets/IconApp/iconsmalface.svg",
      imageEvent:
          "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/9th_may_compressed.mp4?raw=true",
      color: Colors.red,
      Events:
          "https://parade.com/wp-content/uploads/2020/05/nature-quotes.jpg"),
  Evnet(
      title: "Phát hiện người lạ",
      description: "Phát hiện người quen",
      time: "00:00:59 - 12/05/2021",
      channelAvatar: "assets/IconApp/iconsmalface.svg",
      imageEvent:
          "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/9th_may_compressed.mp4?raw=true",
      color: Colors.orangeAccent,
      Events:
          "https://parade.com/wp-content/uploads/2020/05/nature-quotes.jpg"),
  Evnet(
      title: "Phát hiên đối tượng nguy hiểm",
      description: "Phát hiện người quen",
      time: "19:30:59 - 12/05/2021",
      channelAvatar: "assets/IconApp/iconsmalface.svg",
      imageEvent:
          "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/9th_may_compressed.mp4?raw=true",
      color: Colors.red,
      Events:
          "https://parade.com/wp-content/uploads/2020/05/nature-quotes.jpg"),
  Evnet(
      title: "Phát hiên đối tượng nguy hiểm",
      description: "Phát hiện người quen",
      time: "19:30:59 - 12/05/2021",
      channelAvatar: "assets/IconApp/iconsmalface.svg",
      imageEvent:
          "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/9th_may_compressed.mp4?raw=true",
      color: Colors.red,
      Events:
          "https://parade.com/wp-content/uploads/2020/05/nature-quotes.jpg"),
  Evnet(
      title: "Phát hiên đối tượng nguy hiểm",
      description: "Phát hiện người quen",
      time: "19:30:59 - 12/05/2021",
      channelAvatar: "assets/IconApp/iconsmalface.svg",
      imageEvent:
          "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/9th_may_compressed.mp4?raw=true",
      color: Colors.red,
      Events:
          "https://parade.com/wp-content/uploads/2020/05/nature-quotes.jpg"),
  Evnet(
      title: "Phát hiện người lạ",
      description: "Phát hiện người quen",
      time: "00:00:59 - 12/05/2021",
      channelAvatar: "assets/IconApp/iconsmalface.svg",
      imageEvent:
          "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/9th_may_compressed.mp4?raw=true",
      color: Colors.orangeAccent,
      Events:
          "https://parade.com/wp-content/uploads/2020/05/nature-quotes.jpg"),
  Evnet(
      title: "Phát hiện người lạ",
      description: "Phát hiện người quen",
      time: "00:00:59 - 12/05/2021",
      channelAvatar: "assets/IconApp/iconsmalface.svg",
      imageEvent:
          "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/9th_may_compressed.mp4?raw=true",
      color: Colors.orangeAccent,
      Events:
          "https://parade.com/wp-content/uploads/2020/05/nature-quotes.jpg"),
  Evnet(
      title: "Phát hiện người lạ",
      description: "Phát hiện người quen",
      time: "00:00:59 - 12/05/2021",
      channelAvatar: "assets/IconApp/iconsmalface.svg",
      imageEvent:
          "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/9th_may_compressed.mp4?raw=true",
      color: Colors.orangeAccent,
      Events:
          "https://parade.com/wp-content/uploads/2020/05/nature-quotes.jpg"),
  Evnet(
      title: "Phát hiện người lạ",
      description: "Phát hiện người quen",
      time: "00:00:59 - 12/05/2021",
      channelAvatar: "assets/IconApp/iconsmalface.svg",
      imageEvent:
          "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/9th_may_compressed.mp4?raw=true",
      color: Colors.orangeAccent,
      Events:
          "https://parade.com/wp-content/uploads/2020/05/nature-quotes.jpg"),
  Evnet(
      title: "Phát hiện người lạ",
      description: "Phát hiện người quen",
      time: "00:00:59 - 12/05/2021",
      channelAvatar: "assets/IconApp/iconsmalface.svg",
      imageEvent:
          "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/the_valley_compressed.mp4?raw=true",
      color: Colors.orangeAccent,
      Events:
          "https://parade.com/wp-content/uploads/2020/05/nature-quotes.jpg"),
  Evnet(
      title: "Phát hiện người lạ",
      description: "Phát hiện người quen",
      time: "00:00:59 - 12/05/2021",
      channelAvatar: "assets/IconApp/iconsmalface.svg",
      imageEvent:
          "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/the_valley_compressed.mp4?raw=true",
      color: Colors.orangeAccent,
      Events:
          "https://parade.com/wp-content/uploads/2020/05/nature-quotes.jpg"),
  Evnet(
      title: "Phát hiện người quen",
      description: "Phát hiện người quen",
      time: "17:30:00 - 12/05/2021",
      channelAvatar: "assets/IconApp/iconsmalface.svg",
      imageEvent:
          "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/the_valley_compressed.mp4?raw=true",
      color: Colors.green,
      Events:
          "https://parade.com/wp-content/uploads/2020/05/nature-quotes.jpg"),
  Evnet(
      title: "Phát hiện người quen",
      description: "Phát hiện người quen",
      time: "17:30:00 - 12/05/2021",
      channelAvatar: "assets/IconApp/iconsmalface.svg",
      imageEvent:
          "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/the_valley_compressed.mp4?raw=true",
      color: Colors.green,
      Events:
          "https://parade.com/wp-content/uploads/2020/05/nature-quotes.jpg"),
  Evnet(
      title: "Phát hiện người quen",
      description: "Phát hiện người quen",
      time: "17:30:00 - 12/05/2021",
      channelAvatar: "assets/IconApp/iconsmalface.svg",
      imageEvent:
          "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/rio_from_above_compressed.mp4?raw=true",
      color: Colors.green,
      Events:
          "https://parade.com/wp-content/uploads/2020/05/nature-quotes.jpg"),
  Evnet(
      title: "Phát hiện người quen",
      description: "Phát hiện người quen",
      time: "17:30:00 - 12/05/2021",
      channelAvatar: "assets/IconApp/iconsmalface.svg",
      imageEvent:
          "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/rio_from_above_compressed.mp4?raw=true",
      color: Colors.green,
      Events:
          "https://parade.com/wp-content/uploads/2020/05/nature-quotes.jpg"),
  Evnet(
      title: "Phát hiện người lạ",
      description: "Phát hiện người quen",
      time: "00:00:59 - 12/05/2021",
      channelAvatar: "assets/IconApp/iconsmalface.svg",
      imageEvent:
          "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/the_valley_compressed.mp4?raw=true",
      color: Colors.orangeAccent,
      Events:
          "https://parade.com/wp-content/uploads/2020/05/nature-quotes.jpg"),
];

class branch {
  final String namebranch;
  branch({
    required this.namebranch,
  });
}

class Timeevent {
  final String time;
  Timeevent({
    required this.time,
  });
}

class ListCameras {
  final String brand;
  List listcamera = ["Camera 1 , Camera 2 , Camera 3"];
  ListCameras({required this.brand, required this.listcamera});
}

List<branch> listbranh = [
  branch(namebranch: "Phát hiện khách hàng"),
  branch(namebranch: "Phát hiện xâm nhập"),
  branch(namebranch: "Phát hiện khỏi lửa"),
  branch(namebranch: "Phát hiện nhân viên"),
];

List<Timeevent> Time = [
  Timeevent(time: "1 ngày"),
  Timeevent(time: "1 tuần"),
  Timeevent(time: "1 tháng"),
  Timeevent(time: "Khoản thời gian"),
];

List<ListCameras> ListCamera = [
  ListCameras(
      brand: "Chi nhánh 1", listcamera: ["Camera 1 , Camera 2 , Camera 3"].toList()),
  ListCameras(
      brand: "Chi nhánh 2", listcamera: ["Camera 1 , Camera 2 , Camera 3"].toList()),
  ListCameras(
      brand: "Chi nhánh 3", listcamera: ["Camera 1 , Camera 2 , Camera 3"].toList()),
  ListCameras(
      brand: "Chi nhánh 4", listcamera: ["Camera 1 , Camera 2 , Camera 3"].toList()),
];

class branchs {
  final String namebranchs;
  final List<String> listCamera;
  branchs({
    required this.namebranchs,
    required this.listCamera,
  });
}

List<branchs> listbranhs = [
  branchs(namebranchs: "Chi nhánh 1", listCamera: ["2131", "321321"]),
  branchs(namebranchs: "Chi nhánh 2", listCamera: ["2131", "321321"]),
  branchs(namebranchs: "Chi nhánh 3", listCamera: ["2131", "321321"]),
  branchs(namebranchs: "Chi nhánh 4", listCamera: ["2131", "321321"]),
];
