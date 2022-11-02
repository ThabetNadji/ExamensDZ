import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class resultWidget extends StatelessWidget {
  String textQ;
  String repU;
  String correctRe;

  resultWidget(String x, String y, String z) {
    textQ = x;
    repU = y;
    correctRe = z;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.green)),
        child: Column(
          children: [
            Text(textQ,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13.0,
                  //color: Colors.orange,
                  fontFamily: 'Kufi',
                )),
            Text(repU,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13.0,
                  //color: Colors.orange,
                  fontFamily: 'Kufi',
                )),
            Text(correctRe,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13.0,
                  //color: Colors.orange,
                  fontFamily: 'Kufi',
                ))
          ],
        ));
  }
}
