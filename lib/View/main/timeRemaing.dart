import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

class timeRemaining extends StatefulWidget {
  @override
  _timeRemainingState createState() => _timeRemainingState();
}

class _timeRemainingState extends State<timeRemaining> {
  int estimateTs = DateTime(2023, 06, 06, 00, 00, 00).millisecondsSinceEpoch;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //height: 30,
          //width: 675,
          decoration: BoxDecoration(
              //color: Colors.green,
              borderRadius: BorderRadius.circular(5)),
          child: Column(
            children: [
              StreamBuilder(
                  stream: Stream.periodic(Duration(seconds: 1), (i) => i),
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    DateFormat format = DateFormat("mm:ss");
                    int now = DateTime.now().millisecondsSinceEpoch;
                    Duration remaining =
                        Duration(milliseconds: estimateTs - now);
                    var dateString =
                        '${remaining.inHours}:${format.format(DateTime.fromMillisecondsSinceEpoch(remaining.inMilliseconds))}';
                    var dayX = remaining.inHours / 24;
                    var min = remaining.inHours * 60;
                    var sec = min * 60;

                    double day;
                    if (dayX >= 0) {
                      day = dayX;
                    } else {
                      day = 0;
                      min = 0;
                      sec = 0;
                      dateString = '0';
                    }
                    //print(dateString);
                    return Container(
                      color: Colors.greenAccent.withOpacity(0.3),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Text(
                                  ' 2023 الـوقـت المـتـبـقـي لــشـهــادة التعليم المتوسط  ',
                                  style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.0,
                                    //color: Colors.orange,
                                    fontFamily: 'Kufi',
                                  ))
                            ],
                          ),
                          Column(
                            children: [
                              //remaining

                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, //Center Row contents horizontally,
                                crossAxisAlignment: CrossAxisAlignment
                                    .center, //Center Row contents vertically,
                                children: [
                                  Row(
                                    children: [
                                      Text('  يـــــوم  ',
                                          style: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.0,
                                            //color: Colors.orange,
                                            fontFamily: 'Kufi',
                                          ))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .center, //Center Row contents horizontally,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center, //Center Row contents vertically,
                                    children: [
                                      Text(
                                          '- الوقت بالأيام :     ' +
                                              '             ' +
                                              day.toInt().toString(),
                                          textDirection: ui.TextDirection.rtl,
                                          style: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.0,
                                            //color: Colors.orange,
                                            fontFamily: 'Kufi',
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, //Center Row contents horizontally,
                                crossAxisAlignment: CrossAxisAlignment
                                    .center, //Center Row contents vertically,
                                children: [
                                  Row(
                                    children: [
                                      Text('ســــــاعــة',
                                          style: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.0,
                                            //color: Colors.orange,
                                            fontFamily: 'Kufi',
                                          ))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          '- الوقت بالساعات :    ' + dateString,
                                          textDirection: ui.TextDirection.rtl,
                                          style: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.0,
                                            //color: Colors.orange,
                                            fontFamily: 'Kufi',
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                              Text('بالتـــوفـيق لكــل مجـتهــد ',
                                  style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.0,
                                    //color: Colors.orange,
                                    fontFamily: 'Kufi',
                                  ))
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            ],
          ),
        )
      ],
    );
  }
}
