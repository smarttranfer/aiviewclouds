import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FieldDialog extends StatefulWidget {
  const FieldDialog({required String this.Contents, Key? key})
      : super(key: key);
  final String Contents;
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
