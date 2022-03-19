import 'package:flutter/material.dart';
import './entry.dart';
import '../PrimerAndSecondray/listCoursesPrimer.dart';

class InitData {
  List<Entry> data;

  List getData(BuildContext context) {
    return data = <Entry>[
      Entry(
        //'التعليم المتوسط',
        '                  التعليم المتوسط               ',
        <Widget>[
          ListTile(
            title: Text(' -  أولى متوسط   ',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.023,
                  fontFamily: 'Kufi',
                )),
            contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ListCoursesPrimer(('أولى متوسط'), ('2_Secondary'))));
            },
          ),
          ListTile(
            title: Text(' -  الثانية متوسط   ',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.023,
                  fontFamily: 'Kufi',
                )),
            contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ListCoursesPrimer(
                          ('الثانية متوسط'), ('2_Secondary'))));
            },
          ),
          ListTile(
            title: Text(' -  الثالثة متوسط   ',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.023,
                  fontFamily: 'Kufi',
                )),
            contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ListCoursesPrimer(
                          ('الثالثة متوسط'), ('2_Secondary'))));
            },
          ),
          ListTile(
            title: Text(' -  الرابعة متوسط   ',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.023,
                  fontFamily: 'Kufi',
                )),
            contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ListCoursesPrimer(
                          ('الرابعة متوسط'), ('2_Secondary'))));
            },
          )
        ],
      ),
    ];
  }

  //final List<Entry> data =
}
