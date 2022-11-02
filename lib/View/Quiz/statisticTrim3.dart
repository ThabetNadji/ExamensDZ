import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myEduApp/Services/quizServices.dart';
import 'userGlobal.dart' as userGlobal;

class statisticTrim3 extends StatelessWidget {
  quizServices _quizService = new quizServices();
  String scoreInTrim = "0";
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 15.0, right: 15),
        child: Table(children: [
          TableRow(decoration: BoxDecoration(color: Colors.purple), children: [
            Center(
              child: Text(''),
            ),
            Text('الفصل الثالث',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13.0,
                  //color: Colors.orange,
                  fontFamily: 'Kufi',
                )),
          ]),
          TableRow(children: [
            Center(
              // x , y
              child: FutureBuilder(
                future: _quizService.getExamNumberOfTrim(
                    //third_trim
                    userGlobal.getUserInfo().getUserID(),
                    'third_trim'), // x
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // there is some data
                    if (snapshot.data.toString() != '-1') {
                      //return Text(snapshot.data.toString());
                      return FutureBuilder(
                        future: _quizService
                            .getNumberOfExamsInTrim('third_trim'), // y
                        builder: (context, _snapshot) {
                          if (_snapshot.hasData) {
                            if (_snapshot.data.toString() != '-1') {
                              scoreInTrim = _snapshot.data.toString();
                              return Text(
                                snapshot.data.toString() +
                                    ' من أصل ' +
                                    _snapshot.data.toString(),
                                style: new TextStyle(
                                  fontSize: 13.0,
                                  //color: Colors.orange,
                                  fontFamily: 'Kufi',
                                  color: Colors.white,
                                  //fontWeight: FontWeight.bold
                                ),
                                textDirection: TextDirection.rtl,
                              );
                            } else {
                              // there is a data but an error occured will processing
                              return Text('something went wrong ...');
                            }
                          } else {
                            print('waiting getNumberOfExamsInTrim');
                            return CupertinoActivityIndicator(); // no data to load
                          }
                        },
                      );
                    } else {
                      // there is a data but an error occured will processing
                      return Text('something went wrong ...');
                    }
                  } else {
                    print('waiting getExamNumberOfTrim');
                    return CupertinoActivityIndicator(); // no data to load
                  }
                },
              ),
            ),
            Text(
              '  عدد الإختبارات المنجزة  ',
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height * 0.02, //13
                color: Colors.white,
                fontFamily: 'Kufi',
              ),
              textDirection: TextDirection.rtl,
            ),
          ]),
          TableRow(children: [
            Center(
              child: FutureBuilder(
                future: _quizService.getScoreOfTrim(
                    userGlobal.getUserInfo().getUserID(), 'third_trim'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.toString() != '-1') {
                      return FutureBuilder(
                        future: _quizService
                            .getNumberOfExamsInTrim('third_trim'), // y
                        builder: (context, _snapshot) {
                          if (_snapshot.hasData) {
                            if (_snapshot.data.toString() != '-1') {
                              scoreInTrim = _snapshot.data.toString();
                              int xy = int.parse(scoreInTrim);
                              int _xy = xy * 20;
                              String xy_ = _xy.toString();
                              return Text(
                                snapshot.data.toString() + ' من أصل ' + xy_,
                                style: new TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 13.0,
                                  color: Colors.white,
                                  fontFamily: 'Kufi',
                                ),
                                textDirection: TextDirection.rtl,
                              );
                            } else {
                              // there is a data but an error occured will processing
                              return Text('something went wrong ...');
                            }
                          } else {
                            print('waiting getNumberOfExamsInTrim');
                            return CupertinoActivityIndicator(); // no data to load
                          }
                        },
                      );
                    } else {
                      return Text('something went wrong ...');
                    }
                  } else {
                    print('waiting getExamNumberOfTrim');
                    return CupertinoActivityIndicator(); // no data to load
                  }
                },
              ),
            ),
            Text(
              '  مجموع النقاط  ',
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height * 0.02, //13
                //color: Colors.orange,
                fontFamily: 'Kufi',
              ),
              textDirection: TextDirection.rtl,
            ),
          ]),
          TableRow(children: [
            Center(
              child: FutureBuilder(
                future: _quizService.getScoreOfTrim(
                    userGlobal.getUserInfo().getUserID(), 'third_trim'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.toString() != '-1') {
                      return FutureBuilder(
                        future: _quizService
                            .getNumberOfExamsInTrim('third_trim'), // y
                        builder: (context, _snapshot) {
                          if (_snapshot.hasData) {
                            if (_snapshot.data.toString() != '-1') {
                              int a = int.parse(snapshot.data.toString());
                              int b = int.parse(_snapshot.data.toString());
                              double moyenne = a / b;
                              return Text(
                                moyenne.toStringAsFixed(2) + '/20',
                                style: new TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 11.0,
                                  color: Colors.orange,
                                  fontFamily: 'Kufi',
                                ),
                                textDirection: TextDirection.rtl,
                              );
                            } else {
                              // there is a data but an error occured will processing
                              return Text('something went wrong ...');
                            }
                          } else {
                            print('waiting getNumberOfExamsInTrim');
                            return CupertinoActivityIndicator(); // no data to load
                          }
                        },
                      );
                    } else {
                      return Text('something went wrong ...');
                    }
                  } else {
                    print('waiting getExamNumberOfTrim');
                    return CupertinoActivityIndicator(); // no data to load
                  }
                },
              ),
            ),
            Text(
              '  معدل الثلاثي الثالث  ',
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height * 0.02, //13
                //color: Colors.orange,
                fontFamily: 'Kufi',
              ),
              textDirection: TextDirection.rtl,
            ),
          ])
        ]));
  }
}
