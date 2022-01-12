import 'package:aiview/model/ModelCamera.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'FieldDialog.dart';

List<Widget> Listcheckbox = [];
List<Widget> Listbands = [];

class Dialogs extends StatelessWidget {
  Dialogs({required Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: HexColor("#2B2F33"),
        ),
        backgroundColor: HexColor("#2B2F33"),
        body: Center(
          child: Container(
            child: ListnameEx(),
          ),
        ));
  }
}

Widget ListnameEx() {
  Listcheckbox.clear();
  for (var i in listbranh) {
    Listcheckbox.add(FieldDialog(
      Contents: i.namebranch,
    ));
  }
  return SingleChildScrollView(child: Column(
      children: Listcheckbox));
}
