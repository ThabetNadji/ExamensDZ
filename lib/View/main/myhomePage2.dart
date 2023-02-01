import 'package:flutter/material.dart';
import 'package:myEduApp/View/main/quizMain.dart';
import 'package:myEduApp/View/main/timeRemaing.dart';
import '../PrimerAndSecondray/horizantalListView.dart';
import 'cardHomeWidgetDark.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10, //Use of SizedBox
            ),
            timeRemaing(),
            SizedBox(
              height: 10, //Use of SizedBox
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Divider(
                    height: 10, endIndent: 50, indent: 50, color: Colors.white),
                Text(' حساب المعدلات ',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: 'Kufi',
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                Container(
                  height: 120,
                  child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [horizantalListView()]),
                ),
              ],
            ),
            Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15, //Use of SizedBox
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              cardHomeWidgetDark(
                                  'assets/images/educ2.png',
                                  ' مواضيع شهادة التعليم المتوسط لسنوات الماضيه مع التصحيح النموذجي ',
                                  'Bem',
                                  'bem',
                                  ''),
                            ],
                          ),
                        ),
                        //nativeAds(),
                        Container(
                          //height: 10,
                          //width: 10,
                          child: Column(
                            children: <Widget>[
                              quizMain(
                                  'assets/images/ic_launcher.png',
                                  'لتحضير لشهادة التعليم المتوسط بشكل مختلف\nإكتشفوا تطبيقنا الجديد "Bem Quiz Dz" ',
                                  'إبدء'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
