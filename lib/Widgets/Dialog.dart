import 'package:aiview/model/ModelCamera.dart';
import 'package:flutter/material.dart';
import 'FieldDialog.dart';
import 'FieldDialogBrand.dart';

List<Widget> Listcheckbox = [];
List<Widget> Listbands = [];

class Dialogs extends StatelessWidget {
  Dialogs({required Key? key}) : super(key: key);

  // @override
  // _Dialog createState() => _Dialog();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: Color(0x404447),
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            child: ListnameEx(),
          ),
        ));
  }
}

// class _Dialog extends State<Dialogs> {
//   @override
//   Widget build(BuildContext context) {
//     return ListnameEx();
//   }
// }

Widget ListnameEx() {
  Listcheckbox.clear();
  for (var i in listbranh) {
    Listcheckbox.add(FieldDialog(
      Contents: i.namebranch,
    ));
  }
  return SingleChildScrollView(child: Column(children: Listcheckbox));
}
