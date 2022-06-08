import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:myEduApp/View/Quiz/quizMain.dart';
import 'package:myEduApp/View/Quiz/quizMainLight.dart';
import 'package:myEduApp/View/main/theme.dart';
import 'package:myEduApp/View/main/timeRemaing.dart';
import 'package:provider/provider.dart';
import '../../Controller/GetConroller.dart';
import '../PrimerAndSecondray/horizantalListView.dart';
import '../SideDrawer/sideDrawer.dart';
import '../ad_helper/ad_helper.dart';
import 'cardHomeWidget.dart';
import 'cardHomeWidgetDark.dart';

class HomePage extends StatelessWidget {
  // set needed date

  /*set ads
  @override
  void initState() {
    // TODO: implement initState
    //AdHelper.disposeAd();
    AdHelper.myBanner.load();
    super.initState();
  }
  AdWidget adWidget = AdWidget(ad: AdHelper.myBanner);*/

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, value, child) {
      return new MaterialApp(
          theme: value.getTheme(),
          home: Scaffold(
            drawer: SideDrawer(),
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                ' الـتـعـلـيـم الـمـتـوســــــط - Examens DZ ',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.015,
                  color: Colors.orange,
                  fontFamily: 'Kufi',
                ),
              ),
              actions: <Widget>[
                value.getTheme() == ThemeData.light().copyWith()
                    ? IconButton(
                        icon:
                            Icon(Icons.toggle_off_rounded), //toggle_on_outlined
                        color: Colors.black,
                        onPressed: () {
                          Provider.of<ThemeProvider>(context, listen: false)
                              .swapTheme();
                        },
                      )
                    : Text(''),
              ],
              flexibleSpace: Container(
                decoration: value.getTheme() == ThemeData.light().copyWith()
                    ? BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              const Color(0xFF167F57),
                              const Color(0xFF167F77),
                              const Color(0xFF167F82),
                              const Color(0xFF167F99)
                              //add more colors for gradient
                            ],
                            begin:
                                Alignment.topLeft, //begin of the gradient color
                            end: Alignment.topRight, //end of the gradient color
                            stops: [0, 0.2, 0.7, 0.8]),

                        borderRadius:
                            BorderRadius.circular(0), //border corner radius
                      )
                    : BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              const Color(0x00000000),
                              const Color(0x00000000),
                              const Color(0x00000000),
                              const Color(0x00000000)
                              //add more colors for gradient
                            ],
                            begin:
                                Alignment.topLeft, //begin of the gradient color
                            end: Alignment.topRight, //end of the gradient color
                            stops: [0, 0.2, 0.7, 0.8]),

                        borderRadius:
                            BorderRadius.circular(0), //border corner radius
                      ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10, //Use of SizedBox
                  ),
                  timeRemaining(),
                  SizedBox(
                    height: 10, //Use of SizedBox
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Divider(
                          height: 10,
                          endIndent: 50,
                          indent: 50,
                          color: Colors.white),
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
                                //height: MediaQuery.of(context).size.height * 0.380, //165, //235,
                                //width: MediaQuery.of(context).size.width * 0.9, //310
                                child: Column(
                                  children: <Widget>[
                                    value.getTheme() ==
                                            ThemeData.light().copyWith()
                                        ? cardHomeWidget(
                                            'assets/images/educ2.png',
                                            'مواضيع شهادة التعليم المتوسط للسنوات الماضيه مع الحل ',
                                            'Bem',
                                            'bem',
                                            '')
                                        : cardHomeWidgetDark(
                                            'assets/images/educ2.png',
                                            'مواضيع شهادة التعليم المتوسط للسنوات الماضيه مع الحل ',
                                            'Bem',
                                            'bem',
                                            ''),
                                  ],
                                ),
                              ),
                              //nativeAds(),
                              Container(
                                //width: 400,
                                //height: 673,
                                child: Column(
                                  children: <Widget>[
                                    value.getTheme() ==
                                            ThemeData.light().copyWith()
                                        ? quizMainLight(
                                            'assets/images/quiz1.png',
                                            'العب و تعلم مع Quiz Game  ',
                                            'إبدء')
                                        : quizMain(
                                            'assets/images/quiz.png',
                                            'حضر لشهادة التعليم المتوسط بطريقة مسلية و ممتعة مع  QuizGame ',
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
          ));
    });
  }
}
