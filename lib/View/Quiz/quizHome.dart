import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myEduApp/View/Buttons/quizButton.dart';
import 'userGlobal.dart' as userGlobal;

// ignore: camel_case_types
class quizHome extends StatefulWidget {
  String trimText = "";
  String years = "4eme", level = "2_Secondary";
  @override
  _quizHomeState createState() => _quizHomeState();
}

// ignore: camel_case_types
class _quizHomeState extends State<quizHome> {
  String trim = "trims";

  @override
  Widget build(BuildContext context) {
    String hintText = "إختر الفصل الدراسي";

    return Container(
        child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(
              height: 75, //Use of SizedBox
            ),
            Container(
              width: 40.0,
            ),
            Flexible(
              child: Center(
                child: new DropdownButton<String>(
                  hint: Text(
                    hintText,
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                        fontFamily: 'Kufi'),
                  ),
                  onChanged: (String newVal) {
                    setState(() {
                      widget.trimText = newVal;
                      trim = newVal;
                    });
                  },
                  items: <String>[
                    'الثلاثي الأول',
                    'الثلاثي الثاني',
                    'الثلاثي الثالث',
                  ].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: Column(
                        children: [
                          new Center(
                            child: Text(value),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Container(
              width: 40.0,
            ),
          ],
        ),
        SizedBox(
          //Use of SizedBox
          height: 0,
        ),
        widget.trimText != ''
            ? Center(
                child: Text(
                  widget.trimText + '   ',
                  style: new TextStyle(
                      fontSize: 17.0, color: Colors.green, fontFamily: 'Kufi'),
                ),
              )
            : Text(
                widget.trimText,
                style: new TextStyle(
                    fontSize: 20.0, color: Colors.white, fontFamily: 'Kufi'),
              ),
        SizedBox(
          height: 5, //Use of SizedBox
        ),
        Text(
          'قائمة المواد',
          style: new TextStyle(
              fontSize: 20.0, color: Colors.white, fontFamily: 'Kufi'),
        ),
        SizedBox(
          height: 5, //Use of SizedBox
        ),
        Flexible(
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment:
                CrossAxisAlignment.center, //Center Row contents vertically,
            children: [
              quizButton('اللغة العربية', Icons.auto_stories, trim),
              quizButton('الرياضيات', Icons.calculate, trim),
            ],
          ),
        ),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment //
                .center, //Center Row contents horizontally,
            crossAxisAlignment:
                CrossAxisAlignment.center, //Center Row contents vertically,
            children: [
              quizButton('علوم الطبيعة', Icons.biotech_sharp, trim),
              quizButton(' الإسلامية', Icons.brightness_low_outlined, trim),
            ],
          ),
        ),
        Flexible(
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment:
                CrossAxisAlignment.center, //Center Row contents vertically,
            children: [
              quizButton('التربية مدنية', Icons.account_balance_outlined, trim),
              quizButton(' الفرنسية', Icons.language, trim),
            ],
          ),
        ),
        Flexible(
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment:
                CrossAxisAlignment.center, //Center Row contents vertically,
            children: [
              quizButton('الإجتماعيات', Icons.explore, trim),
              quizButton('الإعلام آلي', Icons.computer, trim),
            ],
          ),
        ),
        Flexible(
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment:
                CrossAxisAlignment.center, //Center Row contents vertically,
            children: [
              quizButton('الإنجليزية', Icons.g_translate_sharp, trim),
              quizButton('الفيزياء', Icons.science_outlined, trim),
            ],
          ),
        ),
        Spacer(),
        Spacer(),
      ],
    ));
  }
}
