import 'package:flutter/material.dart';
import 'package:myEduApp/View/Quiz/LoggedInPage.dart';
import 'package:myEduApp/View/Quiz/test.dart';
import 'userGlobal.dart' as userGlobal;

class quizMain extends StatefulWidget {
  String image, textDetail, textButton, year, level;

  quizMain(this.image, this.textDetail, this.textButton);
  @override
  _quizMainWidgetState createState() => _quizMainWidgetState();
}

// ignore: camel_case_types
class _quizMainWidgetState extends State<quizMain> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.28, //165, //235,
        width: MediaQuery.of(context).size.width * 0.9, //310,
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.centerLeft,
            image: AssetImage(
              widget.image,
            ),
            //fit: BoxFit.none,
          ),
          gradient: LinearGradient(
            colors: [Color(0x0028313B), Color(0x002C3E50)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(10), //border corner radius
        ),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Container(
                // color: Colors.white,
                // ignore: deprecated_member_use
                child: Text(widget.textDetail,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontFamily: 'Kufi',
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Spacer(),
            Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  children: [
                    Spacer(),
                    Column(
                      children: [
                        SizedBox(
                          height: 51,
                        ),
                        InkWell(
                          onTap: () {
                            if (userGlobal.getUserInfo().getUserID() != null) {
                              print('userGlobal.getUserInfo() not null');
                              // print(userGlobal.getUserInfo().getUserID() +
                              //   '  ' +
                              // userGlobal.getUserInfo().getUserName());
                              LoggedInPage logedInPage =
                                  new LoggedInPage(userGlobal.getUserInfo());
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          logedInPage));
                            } else {
                              // go to singin page
                              test t = new test();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) => t));
                            }
                          },
                          child: Ink(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: ' QuizGame',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025, //15,
                                          fontFamily: 'Kufi',
                                          fontWeight: FontWeight.bold)),
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.keyboard_arrow_right,
                                      size: MediaQuery.of(context).size.height *
                                          0.03,
                                      color: Colors.green,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
