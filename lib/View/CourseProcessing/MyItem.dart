import 'package:flutter/material.dart';

import '../Buttons/courseContentButton.dart';

class MyItem {
  List<CourseContentButton> listUrlPDF4 = <CourseContentButton>[];
  bool isExpanded;
  final String header;
  final Widget body;

  MyItem(this.isExpanded, this.header, this.body);
}
