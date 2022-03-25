import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myEduApp/Services/quizServices.dart';
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
  quizServices quizeServe = new quizServices();

  @override
  Widget build(BuildContext context) {
    //userGlobal.setCourseName(widget.courseName);
    //userGlobal.setTrim(widget.trimester);
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
          title: Text("ExamensDZ Quiz Game",
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
                                  return AlertDialog(
                                    title: Center(
                                      child: Text(
                                          'قواعد الإختبار و سلم التنقيط',
                                          textDirection: TextDirection.rtl,
                                          style: new TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.018,
                                              //color: Colors.green,
                                              fontFamily: 'Kufi',
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    content: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.25,
                                      //color: Colors,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text('كل إختبار يتكون من 10 أسئلة',
                                              textDirection: TextDirection.rtl,
                                              style: new TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.012,
                                                  //color: Colors.green,
                                                  fontFamily: 'Kufi',
                                                  fontWeight: FontWeight.bold)),
                                          Text('كل إجابة صحيحة تحسب +2 نقطة ',
                                              textDirection: TextDirection.rtl,
                                              style: new TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.012,
                                                  color: Colors.green,
                                                  fontFamily: 'Kufi',
                                                  fontWeight: FontWeight.bold)),
                                          Text('كل اجابة خاطئة تحتسب -1 نقطة',
                                              textDirection: TextDirection.rtl,
                                              style: new TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.012,
                                                  color: Colors.red,
                                                  fontFamily: 'Kufi',
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              'إذا كنت غير متؤكد من الإجابة الصحيحة فلا تقم بالإجابة على السؤال و إنتقل الى السؤال الموالي مباشرة ',
                                              textDirection: TextDirection.rtl,
                                              style: new TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.012,
                                                  color: Colors.orange,
                                                  fontFamily: 'Kufi',
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              'إذا قمت بالإجابة على سؤال ما و إنتقلت الى السؤال الموالي فلا يمكنك العودة الى السؤال السابق',
                                              textDirection: TextDirection.rtl,
                                              style: new TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.012,
                                                  //color: Colors.green,
                                                  fontFamily: 'Kufi',
                                                  fontWeight: FontWeight.bold)),
                                          Text(''),
                                          Center(
                                            child: Text('بالــتوفــيق',
                                                style: new TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.022,
                                                    color: Colors.green,
                                                    fontFamily: 'Kufi',
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
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
                                                ' this text will never showen ... ')
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
