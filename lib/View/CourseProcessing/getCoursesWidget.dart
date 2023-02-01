import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myEduApp/View/Buttons/courseContentButton.dart';
import 'package:myEduApp/View/Buttons/courseContentButtonMore.dart';
import 'package:myEduApp/View/PDFreader/Viewpdf.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../Controller/GetExpan.dart';
import 'MyItem.dart';

class GetCoursesWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  Viewpdf viewpdf;
  CourseContentButton cButton;
  CourseContentButtonMore cButtonMore;
  String subject, years, tri, level, speciality, yearX;
  GetCoursesWidget(this.subject, this.years, this.tri, this.level,
      this.speciality, this.yearX);

  // function_to_retrive_data_from_Firebse_Storage(Primer and Seconary level)
  // ignore: non_constant_identifier_names
  Future<ListResult> getListCourses_Pr_Se() {
    var listUrl = FirebaseStorage.instance
        .ref(level + '/' + years + '/' + subject + '/' + tri)
        .listAll();
    return listUrl;
  }

  // function_to_retrive_data_from_Firebse_Storage(Primer and Seconary level)
  // ignore: non_constant_identifier_names
  Future<ListResult> getListCourses_4_Se_dev() {
    var listUrl = FirebaseStorage.instance
        .ref(level + '/' + years + '/' + subject + '/' + tri + '/' + 'devoires')
        .listAll();
    return listUrl;
  }

  // function_to_retrive_data_from_Firebse_Storage(Primer and Seconary level)
  // ignore: non_constant_identifier_names
  Future<ListResult> getListCourses_4_Se_exam() {
    var listUrl = FirebaseStorage.instance
        .ref(level + '/' + years + '/' + subject + '/' + tri + '/' + 'examens')
        .listAll();
    return listUrl;
  }

  // function_to_retrive_data_from_Firebse_Storage(bem, 5eme)
  // ignore: non_constant_identifier_names
  Future<ListResult> getListCourses_Pr_Se_End() {
    var listUrl = FirebaseStorage.instance
        .ref(years + '/' + yearX + '/' + subject)
        .listAll();
    return listUrl;
  }

// Coeur1 de l'app
  Widget getCourses() {
    List<MyItem> _itemsDevoire = <MyItem>[];
    List<MyItem> _itemsExamens = <MyItem>[];
    print(level);
    print(years);
    print(subject);
    print(tri);
    int i = 0;
    int j = 0;

    if (years == '4' && tri != 'xmore') {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            child: FutureBuilder<ListResult>(
                future: getListCourses_4_Se_dev(),
                builder: (BuildContext context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text(
                        '     Loading ... ',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    );
                  } else {
                    _itemsDevoire.add(new MyItem(
                        false,
                        '   الفروض  ' +
                            '(' +
                            snapshot.data.items.length.toString() +
                            ')',
                        Column(
                          children: snapshot.data.items.reversed.map((ref_) {
                            //counter++;
                            List<CourseContentButton> listUrlPDF4 =
                                <CourseContentButton>[];
                            i = i + 1;
                            var pdfURL = ref_.getDownloadURL();
                            listUrlPDF4.add(cButton = new CourseContentButton(
                                viewpdf = new Viewpdf(pdfURL, i.toString(), tri,
                                    level, years, subject, ref_.fullPath),
                                i.toString(),
                                '',
                                ref_.fullPath));

                            return (Column(children: listUrlPDF4));
                          }).toList(),
                        )));
                  }

                  return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return new ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          _itemsDevoire[index].isExpanded =
                              !_itemsDevoire[index].isExpanded;
                          print('call back is working ');
                        });
                      },
                      children: _itemsDevoire.map((MyItem item) {
                        return new ExpansionPanel(
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              print('inside the ExpansionPanelList ');
                              return new Container(
                                padding: new EdgeInsets.all(5),
                                child: new Center(
                                  child: Text(
                                    item.header,
                                    style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.orange,
                                      fontFamily: 'Kufi',
                                    ),
                                  ),
                                ),
                              );
                            },
                            body: item.body,
                            isExpanded: item.isExpanded);
                      }).toList(),
                    );
                  });
                }),
          ),
          //SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            child: FutureBuilder<ListResult>(
                future: getListCourses_4_Se_exam(),
                builder: (BuildContext context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CupertinoActivityIndicator(),
                    );
                  } else {
                    _itemsExamens.add(new MyItem(
                        false,
                        '   الإختبارات  ' +
                            '(' +
                            snapshot.data.items.length.toString() +
                            ')',
                        Column(
                          children: snapshot.data.items.reversed.map((ref_) {
                            List<CourseContentButton> listUrlPDF4 =
                                <CourseContentButton>[]; // must be in(the key)
                            j = j + 1;
                            var pdfURL = ref_.getDownloadURL();
                            listUrlPDF4.add(cButton = new CourseContentButton(
                                viewpdf = new Viewpdf(pdfURL, j.toString(), tri,
                                    level, years, subject, ref_.fullPath),
                                j.toString(),
                                '',
                                ref_.fullPath));

                            //return (Text(ref_.fullPath.toString()));
                            return (Column(children: listUrlPDF4));
                          }).toList(),
                        )));
                  }

                  return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return new ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          _itemsExamens[index].isExpanded =
                              !_itemsExamens[index].isExpanded;
                          print('call back is working ');
                        });
                      },
                      children: _itemsExamens.map((MyItem item) {
                        return new ExpansionPanel(
                            //backgroundColor: Colors.black,
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              print('inside the ExpansionPanelList ');
                              return new Container(
                                padding: new EdgeInsets.all(5),
                                child: new Center(
                                  child: Text(
                                    item.header,
                                    style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.orange,
                                      fontFamily: 'Kufi',
                                    ),
                                  ),
                                ),
                              );
                            },
                            body: item.body,
                            isExpanded: item.isExpanded);
                      }).toList(),
                    );
                  });
                }),
          )
        ],
      );
    } else {
      return FutureBuilder<ListResult>(
        future: getListCourses_Pr_Se(),
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                CupertinoActivityIndicator(),
                //CircularProgressIndicator(),
                SizedBox(
                  height: 40,
                ),
                Text('... يتم العمل على جلب البيانات ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Kufi',
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.022,
                        color: Colors.orange)),
              ],
            ));
          } else {
            return Column(
              // ignore: non_constant_identifier_names
              children: snapshot.data.items.map((Ref) {
                List<CourseContentButton> listUrlPDF = <CourseContentButton>[];
                List<CourseContentButtonMore> listUrlPDFMore =
                    <CourseContentButtonMore>[];
                var pdfURL = Ref.getDownloadURL();
                i++;
                if (tri == 'xmore') {
                  listUrlPDFMore.add(cButtonMore = new CourseContentButtonMore(
                      viewpdf = new Viewpdf(pdfURL, Ref.fullPath, tri, level,
                          years, subject, 'Ref.fullPath'),
                      Ref.fullPath));
                } else {
                  listUrlPDF.add(cButton = new CourseContentButton(
                      viewpdf = new Viewpdf(pdfURL, i.toString(), tri, level,
                          years, subject, Ref.fullPath),
                      i.toString(),
                      '',
                      ''));
                }
                if (tri == 'xmore') {
                  return (Column(children: listUrlPDFMore));
                } else {
                  return (Column(children: listUrlPDF));
                }
              }).toList(),
            );
          }
        },
      );
    }
  }

  // Coeur2 de l'app
  Widget getCoursesEnd() {
    return Container(
        child: new FutureBuilder<ListResult>(
      future: getListCourses_Pr_Se_End(),
      builder: (BuildContext context, snapshot) {
        if (!snapshot.hasData) {
          return new Column(
            children: [
              Text('... الملفات غير متوفره الآن',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Kufi',
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.042,
                      color: Colors.orange))
            ],
          );
        } else {
          return Column(
            // ignore: non_constant_identifier_names
            children: snapshot.data.items.map((Ref) {
              List<CourseContentButton> listUrlPDF = <CourseContentButton>[];
              var pdfURL = Ref.getDownloadURL();
              String fullPath = Ref.fullPath;
              listUrlPDF.add(cButton = new CourseContentButton(
                  viewpdf = new Viewpdf(
                      pdfURL, '', '', level, years, subject, Ref.fullPath),
                  fullPath,
                  yearX,
                  ''));
              return (Column(children: listUrlPDF));
            }).toList(),
          );
        }
      },
    ));
  }
}

/*, level,years, subject, Ref.fullPath */
