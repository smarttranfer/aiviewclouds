import 'package:aiview/model/ModelCamera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';
import 'FieldDialog.dart';

List<Widget> Listcheckbox = [];
List<Widget> Listbands = [];

class Dialogscamera extends StatelessWidget {
  Dialogscamera({required Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListnameExcamera(),
    );
  }
}

Widget ListnameExcamera() {
  Listcheckbox.clear();

  for (var i in ListCamera) {
    Listcheckbox.add(
      TreeView(iconSize: 40,nodes: [
        TreeNode(
            content: FieldDialog(
              Contents: i.brand,
            ),
            children: [
                TreeNode(
                    content: FieldDialog(
                  Contents: "Camera1",
                )),
              TreeNode(
                  content: FieldDialog(
                    Contents: "Camera2",
                  )),
              TreeNode(
                  content: FieldDialog(
                    Contents: "Camera3",
                  ))
            ]),
      ]),
    );
  }
  return SingleChildScrollView(child: Column(children: Listcheckbox));
}
