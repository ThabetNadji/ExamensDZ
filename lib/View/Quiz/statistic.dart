import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myEduApp/View/Quiz/statisticTrim1.dart';
import 'package:myEduApp/View/Quiz/statisticTrim2.dart';
import 'package:myEduApp/View/Quiz/statisticTrim3.dart';
import 'package:myEduApp/main.dart';

// ignore: camel_case_types
class statistic extends StatefulWidget {
  @override
  _statisticState createState() => _statisticState();
}

// ignore: camel_case_types
class _statisticState extends State<statistic> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 40,
                        height: 40,
                        decoration: new BoxDecoration(
                            image: new DecorationImage(
                                //fit: BoxFit.fill,
                                image: new AssetImage(
                                    'assets/images/statistic.png')))),
                    Text('        '),
                    Text('إحصائيات',
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          //color: Colors.orange,
                          fontFamily: 'Kufi',
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              statisticTrim1(),
              SizedBox(
                height: 45,
              ),
              statisticTrim2(),
              SizedBox(
                height: 45,
              ),
              statisticTrim3(),
            ],
          )
        ],
      ),
    );
  }
}
