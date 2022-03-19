import 'package:flutter/material.dart';
import 'package:myEduApp/View/EndEduc/listCourses5.dart';
import 'package:myEduApp/View/EndEduc/listCoursesBem.dart';

class branch extends StatefulWidget {
  String year, level;
  listCourses5 five;
  listCoursesBem bem;

  branch(this.year, this.level);

  @override
  _brachState createState() => _brachState();
}

class _brachState extends State<branch> {
  @override
  Widget build(BuildContext context) {
    if (widget.year == 'CinqEme') {
      return widget.five = new listCourses5(widget.year, widget.level);
    } else {
      if (widget.year == 'bem') {
        return widget.bem = new listCoursesBem(widget.year, widget.level);
      }
    }
    return null;
  }
}
