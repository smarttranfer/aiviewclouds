import 'package:aiview/model/Global.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FieldDialog extends StatefulWidget {
  const FieldDialog(
      {required String this.Contents, required int this.name, Key? key})
      : super(key: key);
  final String Contents;
  final int name;
  @override
  State<StatefulWidget> createState() {
    return _FiledDialog();
  }
}

class _FiledDialog extends State<FieldDialog> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.orange;
      }
      return Colors.orange;
    }

    return Container(
        margin: EdgeInsets.only(left: 15),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.Contents,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontStyle: FontStyle.normal),
              ),
              Material(
                  color: HexColor("#2B2F33"),
                  child: Theme(
                    data: ThemeData(unselectedWidgetColor: Colors.grey),
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                          if (isChecked == true) {
                            if (widget.name == 1) {
                              Config.TitleList.add(widget.Contents);
                            } else if (widget.name == 2) {
                              Config.TimeList.add(widget.Contents);
                            } else if(widget.name == 3){
                              Config.CameraList.add(widget.Contents);
                            }
                          } else {
                            if (widget.name == 1) {
                              Config.TitleList.remove(widget.Contents);
                            } else if (widget.name == 2) {
                              Config.TimeList.remove(widget.Contents);
                            } else if(widget.name == 3) {
                              Config.CameraList.remove(widget.Contents);
                            }
                          }
                        });
                      },
                      activeColor: Colors.orange,
                    ),
                  ))
            ],
          ),
        ]));
  }
}
