import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myEduApp/Services/quizServices.dart';
import 'package:myEduApp/View/Quiz/quizRole.dart';
import 'package:myEduApp/View/Quiz/trimesterWidget.dart';

import 'userGlobal.dart' as userGlobal;

// ignore: must_be_immutable
class quizTrimester extends StatefulWidget {
  String courseName, trimester;
  quizTrimester(course, trim) {
    this.courseName = course;
    this.trimester = trim;
  }
  @override
  _quizTrimesterState createState() => _quizTrimesterState();
}

class _quizTrimesterState extends State<quizTrimester> {
  @override
  void initState() {
    super.initState();
  }

  quizServices quizeServe = new quizServices();

  @override
  Widget build(BuildContext context) {
    Widget trimWidget = trimesterWidget(
        'assets/images/no1.png', "1", widget.courseName, widget.trimester);
    Widget trimWidget2 = trimesterWidget(
        'assets/images/no2.png', "2", widget.courseName, widget.trimester);
    Widget trimWidget3 = trimesterWidget(
        'assets/images/no3.png', "3", widget.courseName, widget.trimester);
    var futureExams = quizeServe.getExames(widget.courseName, widget.trimester);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("ExamensDZ QuizGame",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.height * 0.025)),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      'إختبارات ' +
                          widget.trimester +
                          ' في مادة ' +
                          widget.courseName,
                      style: new TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          color: Colors.orange,
                          fontFamily: 'Kufi',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                      height: 25,
                      endIndent: 32,
                      indent: 52,
                      color: Colors.white),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            return showDialog(
                                context: context,
                                builder: (context) {
                                  return quizRole();
                                });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            textDirection: TextDirection.rtl,
                            children: [
                              Text(' *إقرأ قواعد الإختبار و سلم التنقيط ',
                                  textDirection: TextDirection.rtl,
                                  style: new TextStyle(
                                      height: 1.5,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.015,
                                      color: Colors.green,
                                      fontFamily: 'Kufi',
                                      fontWeight: FontWeight.bold)),
                              Icon(Icons.arrow_back_ios,
                                  color: Colors.green, size: 17),
                            ],
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  // loop for
                  FutureBuilder(
                    future: futureExams,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        int numberOfExams = snapshot.data;
                        // to assure showing only 3 examns to the max
                        if (numberOfExams > 3) {
                          // ignore: unnecessary_statements
                          numberOfExams == 3;
                        }
                        if (numberOfExams > 0) {
                          return Column(
                            children: <Widget>[
                              for (int i = 0; i < numberOfExams; i++)
                                i == 0
                                    ? trimWidget
                                    : i == 1
                                        ? trimWidget2
                                        : i == 2
                                            ? trimWidget3
                                            : Text(
                                                ' this text will never shown ... ')
                            ],
                          );
                        } else {
                          return Center(
                            child: Text(
                                ' ... لا يوجد اختبارات في هذا الفصل بعد ،سيتم إضافتها قريبا جدا ',
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                    fontFamily: 'Kufi',
                                    fontWeight: FontWeight.bold)),
                          );
                        }
                      } else {
                        return CupertinoActivityIndicator();
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        )); // end column
  }
}
