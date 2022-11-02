import 'package:flutter/material.dart';
import 'package:myEduApp/Model/question.dart';
import 'package:myEduApp/Model/userDetails.dart';
import 'package:myEduApp/Model/userInwser.dart';
import 'package:myEduApp/View/Quiz/resultWidget.dart';
import 'package:myEduApp/View/Quiz/showResultWidget.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:myEduApp/View/main/NetworkCheck.dart';
import 'userGlobal.dart' as userGlobal;

// ignore: camel_case_types
class quizWidget extends StatefulWidget {
  // ignore: unused_field
  question _qeuestion = new question();
  List<question> listQuiz = new List();
  userDetails userDet;
  int userRepNum;
  int questionNumberInList;

  quizWidget(q, _user) {
    this.listQuiz = q;
    this.userDet = _user;
    //this.questionNumberInList = x;
  }
  @override
  _quizWidgetState createState() => _quizWidgetState();
}

class _quizWidgetState extends State<quizWidget> {
  String uInwser = ' ';
  int score = 0;
  bool isRep = false;
  List<String> _currenctList = List<String>();
  NetworkCheck networkCheck = new NetworkCheck();
  @override
  void initState() {
    ///
    _currenctList.add(widget.listQuiz[0].rep1);
    _currenctList.add(widget.listQuiz[0].rep2);
    _currenctList.add(widget.listQuiz[0].rep3);
    _currenctList.add(widget.listQuiz[0].rep4);

    ///
    super.initState();
    //_isChecked = List<bool>.filled(_currenctList.length, false);
  }

  bool xVal = false;
  int selectedIndex = 99;
  @override
  Widget build(BuildContext context) {
    int questionNumber = 11 - widget.listQuiz.length;
    String _questionNumber = questionNumber.toString();

    // 1* clean userInwserList and set uesrScore to 0
    if (questionNumber == 1) {
      List<userInwser> userInwserList = new List<userInwser>();
      userGlobal.setUserInwserList(userInwserList); // and clean
      widget.userDet.setScore(0);
      print('list anwser is cleand ...');
    }

    final _currentPageNotifier =
        ValueNotifier<int>(int.parse(_questionNumber) - 1);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_questionNumber + '/10  سؤال رقم ',
            style: new TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.03,
                //color: Colors.orange,
                fontFamily: 'Kufi',
                fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Stack(
          children: [
            Column(children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    // page Indicator container
                    Container(
                      child: Column(
                        children: [
                          CirclePageIndicator(
                            size: 10,
                            dotColor: Colors.black,
                            selectedDotColor: Colors.green,
                            itemCount: 10,
                            currentPageNotifier: _currentPageNotifier,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // question container
                    Container(
                      height: 105,
                      //height: MediaQuery.of(context).size.height / 4,
                      decoration: new BoxDecoration(
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(10.0)),
                        boxShadow: [
                          BoxShadow(
                            //color: Colors.grey.withOpacity(0.0),
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(1, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        //scrollDirection: Axis.horizontal,
                        scrollDirection: Axis.vertical,
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.orange,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Text(widget.listQuiz[0].questionText,
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025,
                                    color: Colors.white,
                                    fontFamily: 'Kufi',
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    //SingleChildScrollView(child: Column(children: [],),),
                    ListView.builder(
                      // scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _currenctList.length,
                      itemBuilder: (context, index) {
                        return Card(
                            elevation: 10,
                            color: selectedIndex == index && xVal == true
                                ? Colors.green
                                : Colors.black12,
                            // margin: EdgeInsets.symmetric(vertical: 6),
                            child: Column(
                              children: [
                                CheckboxListTile(
                                  contentPadding: EdgeInsets.all(2),
                                  checkColor: Colors.green,
                                  activeColor: Colors.white,
                                  title: Text(_currenctList[index],
                                      textDirection: TextDirection.rtl,
                                      style: new TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          fontFamily: 'Kufi',
                                          fontWeight: FontWeight.bold)), //txt
                                  value: selectedIndex == index &&
                                      xVal == true, // isChecked?
                                  selected:
                                      selectedIndex == index && xVal == true,
                                  onChanged: (val) {
                                    setState(() {
                                      print('val?');
                                      print(val);
                                      selectedIndex = index;
                                      xVal = val;
                                      //
                                      isRep = val;
                                      if (val == true) {
                                        widget.userRepNum = index; //r
                                        // usr rep or not
                                        uInwser = _currenctList[index];
                                      } else {
                                        widget.userRepNum = -1; //wrng
                                        // usr rep or not
                                        uInwser = '';
                                      }
                                    });
                                  },
                                )
                              ],
                            ));
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Divider(
                        height: 20,
                        endIndent: 32,
                        indent: 52,
                        color: Colors.white),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child: Text('_',
                              style: new TextStyle(
                                  fontSize: 11.0,
                                  color: Colors.orange,
                                  fontFamily: 'Kufi',
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {
                            selectedIndex = -1;
                          },
                        ),
                        Spacer(),
                        ElevatedButton(
                          // color: Colors.green,
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  //borderRadius: BorderRadius.circular(13.0),
                                  )),
                          child: Column(
                            children: [
                              Text('السؤال التالي',
                                  style: new TextStyle(
                                      fontSize: 15.0,
                                      //color: Colors.white70,
                                      fontFamily: 'Kufi',
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          onPressed: () {
                            //// 1 / first of all we have to save user inwser in a list of userIwnser Model
                            userInwser uIn;
                            quizWidget _quizWidget =
                                new quizWidget(widget.listQuiz, widget.userDet);
                            // fetch the correct inwsert text
                            if (widget.listQuiz[0].correctRepNum == 1) {
                              uIn = new userInwser(
                                  widget.listQuiz[0].questionText,
                                  uInwser,
                                  widget.listQuiz[0].rep1);
                            } else {
                              if (widget.listQuiz[0].correctRepNum == 2) {
                                uIn = new userInwser(
                                    widget.listQuiz[0].questionText,
                                    uInwser,
                                    widget.listQuiz[0].rep2);
                              } else {
                                if (widget.listQuiz[0].correctRepNum == 3) {
                                  uIn = new userInwser(
                                      widget.listQuiz[0].questionText,
                                      uInwser,
                                      widget.listQuiz[0].rep3);
                                } else {
                                  uIn = new userInwser(
                                      widget.listQuiz[0].questionText,
                                      uInwser,
                                      widget.listQuiz[0].rep4);
                                }
                              }
                            }
                            userGlobal.addNewAnwser(uIn);

                            // 2- secend step is to check user inwser it true or false to count the score
                            // check if the use choise an inwser or let it null
                            print('--------------------------------');
                            print('isRep value is -> ');
                            print(isRep);
                            if (isRep == true) {
                              // check if the user choise the correct anwser num
                              if (widget.listQuiz[0].correctRepNum ==
                                  widget.userRepNum + 1) {
                                widget.userDet
                                    .setScore(widget.userDet.getScore() + 2);
                              } else {
                                if (widget.listQuiz[0].correctRepNum !=
                                    widget.userRepNum + 1) {
                                  widget.userDet
                                      .setScore(widget.userDet.getScore() - 1);
                                }
                              }
                            } else {
                              // in case user dont choise any rep
                              print('user dont rep ');
                            }
                            widget.listQuiz.removeAt(0);
                            // check if its still a questions
                            if (widget.listQuiz.length > 0) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          (_quizWidget)));
                            } else {
                              // 3- finally create list of widget contient textQustion, userRep and correctInwser to show the result
                              resultWidget showResult;
                              List<resultWidget> _showResultList =
                                  new List<resultWidget>();

                              for (int i = 0;
                                  i < userGlobal.getUserInwserList().length;
                                  i++) {
                                showResult = new resultWidget(
                                    userGlobal
                                        .getUserInwserList()[i]
                                        .questionText,
                                    userGlobal
                                        .getUserInwserList()[i]
                                        .userInwserQuestion,
                                    userGlobal
                                        .getUserInwserList()[i]
                                        .correInwser);
                                _showResultList.add(showResult);
                              }
                              // set exam schema
                              // here ....
                              print('_showResultList.length value -> ');
                              print(_showResultList.length);
                              print('widget.userDet.getScore() value -> ');
                              print(widget.userDet.getScore());
                              // from here ---------- you have to add internet checker

                              // to here ------------
                              // clean globalUserIwserList
                              showResultWidget srw = new showResultWidget(
                                  _showResultList, widget.userDet.getScore());
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          (srw)));
                              List<userInwser> userInwserList =
                                  new List<userInwser>();
                              userGlobal.setUserInwserList(userInwserList);
                            }
                          },
                        ),
                        Text('    '),
                      ],
                    ),
                  ],
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
