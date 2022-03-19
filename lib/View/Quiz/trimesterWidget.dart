import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myEduApp/Model/question.dart';
import 'package:myEduApp/Services/courseNameConvertisor.dart';
import 'package:myEduApp/Services/quizServices.dart';
import 'package:myEduApp/View/Buttons/letsGoButton.dart';
import 'userGlobal.dart' as userGlobal;

class trimesterWidget extends StatelessWidget {
  String imgpath;
  String courseName;
  String trim;
  String examNum;
  trimesterWidget(
      String img, String _examNum, String _courseName, String _trim) {
    this.examNum = _examNum;
    this.imgpath = img;
    this.courseName = _courseName;
    this.trim = _trim;
  }
  @override
  Widget build(BuildContext context) {
    quizServices quizeServe = new quizServices();
    question _question = new question();
    //here you can check if a user pass an exam or not
    String season = '2021-2022'; // you have to get season automatically
    courseNameConvertisor convertor = courseNameConvertisor();
    String cCourseName = convertor.convCourseName(courseName);
    String cTrim = convertor.convTrim(trim);
    String examSchema =
        season + '.' + cCourseName + '.' + cTrim + '.' + examNum;
    var examIsPassed = quizeServe.examIsPassed(
        userGlobal.getUserInfo().getUserID(), examSchema);
    return new Column(
      children: [
        Container(
          height: 80.0,
          width: 300,
          margin: new EdgeInsets.all(10.0),
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
            gradient: new LinearGradient(
                colors: [Colors.yellow[700], Colors.redAccent],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                tileMode: TileMode.clamp),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Padding(
                  padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                  child: new CircleAvatar(
                    radius: 35.0,
                    child: Image.asset(imgpath),
                  )),
              new Expanded(
                  child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(''),
                  new Text(
                    'الإختبار رقم ',
                    style: new TextStyle(
                        fontSize: 17.0,
                        color: Colors.white70,
                        fontFamily: 'Kufi',
                        fontWeight: FontWeight.bold),
                  ),
                  new SizedBox(
                    height: 8.0,
                  ),
                  new SizedBox(
                    height: 10.0,
                  ),
                ],
              )),
              new Container(
                // here do, future examIsPassed?
                child: FutureBuilder(
                  future: examIsPassed,
                  builder: (ocntext, snapshot) {
                    if (snapshot.hasData) {
                      print('trimWidget ...');
                      print(snapshot.data);
                      if (snapshot.data != -1) {
                        return Column(
                          children: [
                            Text(''),
                            Container(
                                height: 30,
                                width: 30,
                                child: Image.asset('assets/images/check.png')),
                            Text(
                                ' النتيجة : ' +
                                    snapshot.data.toString() +
                                    '/20',
                                style: new TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.green,
                                    fontFamily: 'Kufi',
                                    fontWeight: FontWeight.bold))
                          ],
                        );
                      } else {
                        letsGoButton _letsGoButton =
                            new letsGoButton(courseName, trim, examNum);
                        return _letsGoButton;
                      }
                    } else {
                      return Container(
                          height: 30,
                          width: 30,
                          child: CupertinoActivityIndicator());
                    }
                  },
                ),
              ),
              Text('  '), // to make space
            ],
          ),
        ),
        SizedBox(
          height: 25,
        )
      ],
    );
  }
}
