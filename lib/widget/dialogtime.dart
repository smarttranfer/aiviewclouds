import 'package:aiview/model/ModelCamera.dart';
import 'package:flutter/material.dart';
import 'FieldDialog.dart';

List<Widget> Listcheckbox = [];
List<Widget> Listbands = [];

class Dialogstime extends StatelessWidget {
  Dialogstime({required Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: Color(0x404447),
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            child: ListnameExtime(),
          ),
        ));
  }
}

Widget ListnameExtime() {
  Listcheckbox.clear();
  for (var i in Time) {
    Listcheckbox.add(FieldDialog(
      Contents: i.time,name: 2,
    ));
  }
  return SingleChildScrollView(child: Column(
      children: Listcheckbox));
}
