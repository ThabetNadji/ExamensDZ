import 'package:flutter/material.dart';
import 'package:myEduApp/View/Quiz/quizTrimester.dart';

class quizButton extends StatelessWidget {
  String courseName, trim;
  IconData icon;

  quizButton(course, _icon, _trim) {
    this.courseName = course;
    this.icon = _icon;
    this.trim = _trim;
  }

  @override
  Widget build(BuildContext context) {
    // print("coursename: " + courseName);
    //print("trim" + trim);
    return Container(
      margin: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.37, //130,
      height: MediaQuery.of(context).size.height * 0.45, //45,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 22, 133, 66),
          onPrimary: const Color(0xFF63d471),
        ),
        label: Text(
          courseName,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Kufi',
              fontSize: MediaQuery.of(context).size.height * 0.012,
              fontWeight: FontWeight.bold),
        ),
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        onPressed: () {
          if (trim == "trims") {
            showAlertDialog(context);
          } else {
            doGetTrim(context);
          }
        },
      ),
    );
  }

  void showAlertDialog(context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.warning,
                            size: 31,
                            color: Colors.red,
                          ),
                        ),
                        TextSpan(
                            text: "  لم تقم بإختيار الفصل الدراسي  ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontFamily: 'Kufi',
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }

  // ignore: non_constant_identifier_names
  void doGetTrim(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => quizTrimester(this.courseName, this.trim)),
    );
  }
}
