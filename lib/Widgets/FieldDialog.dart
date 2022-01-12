import 'package:flutter/material.dart';

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
        return Colors.blue;
      }
      return Colors.red;
    }

    return SizedBox(
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
                fontStyle: FontStyle.italic),
          ),
          Material(
            color: Colors.black,
            child: Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                }),
          )
        ],
      ),
    ]));
  }
}
