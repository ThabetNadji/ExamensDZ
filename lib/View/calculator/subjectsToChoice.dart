import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../Controller/GetConroller.dart';

class subjectToChoise extends StatefulWidget {
  @override
  State<subjectToChoise> createState() => _subjectToChoiseState();
}

class _subjectToChoiseState extends State<subjectToChoise> {
  Widget build(BuildContext context) {
    return ListView(
      reverse: true,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          // color: Colors.green,
          width: MediaQuery.of(context).size.width / 2.5,
          height: MediaQuery.of(context).size.height / 20,
          decoration: BoxDecoration(
              border: Border(
            left: BorderSide(
              color: Colors.green,
              width: 2,
            ),
          )),
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return GetBuilder<GetController>(
              init: GetController(),
              builder: (gc) => CheckboxListTile(
                checkColor: Colors.white,
                activeColor: Colors.green,
                title: const Text('إحتساب نقطة التربية البدنية',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Kufi',
                        fontSize: 10,
                        fontWeight: FontWeight.bold)),
                value: gc.isCheckedSport,
                onChanged: (bool value) {
                  setState(() {
                    gc.setIsCheckedSport(value);
                  });
                },
                //secondary: const Icon(Icons.hourglass_empty),
              ),
            );
          }),
        ),
        Container(
          // color: Colors.green,
          width: MediaQuery.of(context).size.width / 2.5,
          height: MediaQuery.of(context).size.height / 20,
          decoration: BoxDecoration(
              border: Border(
            left: BorderSide(
              color: Colors.green,
              width: 2,
            ),
          )),
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return GetBuilder<GetController>(
              init: GetController(),
              builder: (gc) => CheckboxListTile(
                checkColor: Colors.white,
                activeColor: Colors.green,
                title: const Text('إحتساب نقطة اللغة الأمازيغية',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Kufi',
                        fontSize: 10,
                        fontWeight: FontWeight.bold)),
                value: gc.isCheckedAmazighe,
                onChanged: (bool value) {
                  setState(() {
                    gc.setIsCheckedAmazighe(value);
                  });
                },
                //secondary: const Icon(Icons.hourglass_empty),
              ),
            );
          }),
        ),
        Container(
          // color: Colors.green,
          width: MediaQuery.of(context).size.width / 2.5,
          height: MediaQuery.of(context).size.height / 20,
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return GetBuilder<GetController>(
              init: GetController(),
              builder: (gc) => CheckboxListTile(
                checkColor: Colors.white,
                activeColor: Colors.green,
                title: const Text('إحتساب نقطة التربية الفنية',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Kufi',
                        fontSize: 10,
                        fontWeight: FontWeight.bold)),
                value: gc.isCheckedArt,
                onChanged: (bool value) {
                  setState(() {
                    gc.setIsCheckedArt(value);
                  });
                },
                //secondary: const Icon(Icons.hourglass_empty),
              ),
            );
          }),
        )
      ],
    );
  }
}
