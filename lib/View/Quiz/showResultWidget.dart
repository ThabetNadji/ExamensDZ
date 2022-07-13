import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:myEduApp/Services/courseNameConvertisor.dart';
import 'package:myEduApp/Services/quizServices.dart';
import 'package:myEduApp/View/Quiz/resultWidget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'getNote.dart';
import 'userGlobal.dart' as userGlobal;

class showResultWidget extends StatefulWidget {
  List<resultWidget> _resultWidget;
  int scoreExam;

  showResultWidget(listResult, int _score) {
    _resultWidget = listResult;
    scoreExam = _score;
  }

  @override
  State<showResultWidget> createState() => _showResultWidgetState();
}

class _showResultWidgetState extends State<showResultWidget> {
  // set ads
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  // and set ads
  @override
  Widget build(BuildContext context) {
    // exam end -> do the necessary => show the result and score ,  setScoreGlobale and setExam to the db
    quizServices quizService = new quizServices();
    courseNameConvertisor converter = courseNameConvertisor();
    //1- set ExamScore and scoreGlobale and save exam schema to database

    // getScoreGlobal
    int scoreGlobal = widget.scoreExam + userGlobal.getUserInfo().getScore();
    // save scoreGlobal in userGlobal for the 3re case if user dont logout
    userGlobal.getUserInfo().setScore(scoreGlobal);
    //upDate score in fb (userID and scoreGlobal)
    quizService.updateScore(userGlobal.getUserInfo().getUserID(), scoreGlobal);
    // getExamSchema and save it to the userExams db
    String userID = userGlobal.getUserInfo().getUserID(); // getUserID
    Future season = quizService.getSeason(); // getSeason
    season.then((result) {
      //getSeason
      String s = result.toString();
      String _season = s.substring(0, 4) + "-" + s.substring(4, 8);
      //get CourseName,trimester and examNum
      String courseName = converter.convCourseName(userGlobal.getExamName());
      String trim = converter.convTrim(userGlobal.getTrimester());
      String examNum = userGlobal.getExamNum();
      //setExamSchema
      String _examSchema =
          _season + '.' + courseName + '.' + trim + '.' + examNum;
      //Save Exam
      quizService.saveExam(userID, _examSchema, widget.scoreExam);
    });

    //2- show result widget
    getNote _getNote = new getNote();
    // ignore: non_constant_identifier_names
    String getNote_ = _getNote.getNoteResult(widget.scoreExam);
    print('showResultWidget ...');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('النتيـجـة',
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.height * 0.02,
              //color: Colors.orange,
              fontFamily: 'Kufi',
            )),
      ),
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Center(
                      child: Text('  الملاحظة : ' + getNote_.toString(),
                          textDirection: TextDirection.rtl,
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                            //color: Colors.orange,
                            fontFamily: 'Kufi',
                          )),
                    ),
                  ),
                  //Spacer(),
                  widget.scoreExam >= 0
                      ? CircularPercentIndicator(
                          radius: MediaQuery.of(context).size.height * 0.10,
                          lineWidth: 4.0,
                          percent: (widget.scoreExam) / 20,
                          center: new Text(widget.scoreExam.toString() + '/20',
                              style: TextStyle(
                                  fontFamily: 'Kufi',
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.04,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          progressColor: widget.scoreExam >= 10
                              ? Colors.green[800]
                              : Colors.orange,
                        )
                      : Center(
                          child: Text('  النتيجة : ' + '0/20',
                              textDirection: TextDirection.rtl,
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                //color: Colors.orange,
                                fontFamily: 'Kufi',
                              )),
                        ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Table(
                  // Allows to add a border decoration around your table
                  children: [
                    TableRow(
                        decoration: BoxDecoration(color: Colors.green),
                        children: [
                          Center(
                            child: Text('إجابتك',
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.0,
                                  //color: Colors.orange,
                                  fontFamily: 'Kufi',
                                )),
                          ),
                          Center(
                            child: Text('الإجابة الصحيحة',
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.0,
                                  //color: Colors.orange,
                                  fontFamily: 'Kufi',
                                )),
                          ),
                          Center(
                            child: Text('السؤال ',
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.0,
                                  //color: Colors.orange,
                                  fontFamily: 'Kufi',
                                )),
                          ),
                        ]),
                  ]),
              Column(
                children: List.from(
                  widget._resultWidget.map(
                    (result) => Table(
                        border: TableBorder(
                          bottom: BorderSide(color: Colors.black45, width: 1),
                          horizontalInside:
                              BorderSide(color: Colors.black45, width: 1),
                        ), // Allows to add a border decoration around your table
                        children: [
                          TableRow(children: [
                            result.repU ==
                                    result
                                        .correctRe // color correct inwser green and wrong inwser red
                                ? Center(
                                    child: Text(result.repU,
                                        style: new TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.green,
                                          fontFamily: 'Kufi',
                                        )),
                                  )
                                : Center(
                                    child: Text(result.repU,
                                        textDirection: TextDirection.rtl,
                                        style: new TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.red,
                                          fontFamily: 'Kufi',
                                        )),
                                  ),
                            Center(
                              child: Text(result.correctRe,
                                  textDirection: TextDirection.rtl,
                                  style: new TextStyle(
                                    fontSize: 13.0,
                                    //color: Colors.orange,
                                    fontFamily: 'Kufi',
                                  )),
                            ),
                            Text(result.textQ,
                                textDirection: TextDirection.rtl,
                                style: new TextStyle(
                                  fontSize: 13.0,
                                  //color: Colors.orange,
                                  fontFamily: 'Kufi',
                                )),
                          ]),
                        ]),
                  ),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
