import 'package:flutter/material.dart';

class FieldDialogBrand extends StatefulWidget {
  const FieldDialogBrand(
      {required String this.Contents, required List this.SubContents, Key? key})
      : super(key: key);
  final String Contents;
  final List SubContents;
  @override
  State<StatefulWidget> createState() {
    return _FiledDialogBrand();
  }
}

class _FiledDialogBrand extends State<FieldDialogBrand> {
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

    return Container(
        child: ListView.builder(
            itemCount: 50,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Wrap(
                          children: [
                            Container(
                                child: Icon(
                                  Icons.check_box,
                                )
                            ),
                            Container(
                              child: Text(
                                  'Category ${index+1}'
                              ),
                            ),
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 16),
                            child: ListView.builder(
                                itemCount: 3,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index2) {
                                  return Wrap(
                                    children: [
                                      Container(
                                          child: Icon(
                                            Icons.check_box,
                                          )
                                      ),
                                      Container(
                                        child: Text(
                                            'Subcategory ${index2+1}'
                                        ),
                                      ),
                                    ],
                                  );
                                }
                            )
                        )

                      ]
                  )
              );
            }
        )
    );
  }
}
