import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:myEduApp/View/CourseProcessing/getCourses.dart';
import 'package:myEduApp/View/main/theme.dart';
import 'package:provider/provider.dart';
import '../ad_helper/ad_helper.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

// ignore: must_be_immutable
class showCoursesEnd extends StatefulWidget {
  String years, courseName, sp, yearX;

  showCoursesEnd(this.courseName, this.years, this.sp, this.yearX);
  @override
  _ShowCoursesState createState() => _ShowCoursesState();
}

class _ShowCoursesState extends State<showCoursesEnd>
    with SingleTickerProviderStateMixin {
  //TabController _tabController;
  List<showCoursesEnd> getCoursesList;
  BuildContext backContext;
  @override
  void initState() {
    //_tabController = TabController(length: 4, vsync: this);
    BackButtonInterceptor.add(myInterceptor);
    AdHelper.disposeAd();
    AdHelper.myBanner.load();
    super.initState();
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    print("BACK BUTTON 2"); // Do some stuff.
    Navigator.pop(backContext);
    return true;
  }

  AdWidget adWidget = AdWidget(ad: AdHelper.myBanner);

  @override
  Widget build(BuildContext context) {
    // to remove space beteween words of sp var
    backContext = context;
    return Consumer<ThemeProvider>(builder: (context, value, child) {
      return MaterialApp(
          theme: value.getTheme(),
          home: Scaffold(
              appBar: AppBar(
                leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                title: Text(widget.years + ' ' + widget.yearX,
                    style: TextStyle(
                        fontFamily: 'Kufi',
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
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
                              begin: Alignment
                                  .topLeft, //begin of the gradient color
                              end: Alignment
                                  .topRight, //end of the gradient color
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
                              begin: Alignment
                                  .topLeft, //begin of the gradient color
                              end: Alignment
                                  .topRight, //end of the gradient color
                              stops: [0, 0.2, 0.7, 0.8]),

                          borderRadius:
                              BorderRadius.circular(0), //border corner radius
                        ),
                ), // green
              ),
              bottomNavigationBar: Container(
                height: 50,
                color: Colors.black38,
                child: adWidget,
              ),
              body: Center(
                child: Wrap(
                  children: [
                    Column(
                      children: [
                        Text(' المادة : ' + widget.courseName,
                            style: TextStyle(
                                fontFamily: 'Kufi',
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        Text(widget.years + '   : الشهادة',
                            style: TextStyle(
                                fontFamily: 'Kufi',
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        Text(' الموسم الدراسي : ' + widget.yearX,
                            style: TextStyle(
                                fontFamily: 'Kufi',
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 20, //Use of SizedBox
                        ),
                        GetCourses(widget.courseName, widget.years, '', '',
                            widget.sp, widget.yearX),
                        SizedBox(
                          height: 100, //Use of SizedBox
                        ),
                      ],
                    ),
                  ],
                ),
              )));
    });
  }
}
