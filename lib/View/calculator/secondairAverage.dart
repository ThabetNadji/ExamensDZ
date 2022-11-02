import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:myEduApp/Services/averageCalculator.dart';

import '../ad_helper/interstitialAds.dart';

class secondairAverage extends StatefulWidget {
  @override
  State<secondairAverage> createState() => _secondairAverageState();
}

class _secondairAverageState extends State<secondairAverage> {
  interstitlaAds _interstitlaAds = interstitlaAds();

  @override
  void initState() {
    BackButtonInterceptor.add(myInterceptor);

    super.initState();
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    info.currentRoute(context);
    print("BACK BUTTON1"); // Do some stuff.
    Navigator.pop(context);
    try {
      _interstitlaAds.interstitialAd.show();
    } catch (ex) {
      print('ops...');
      print('something went wrong, ads faild to load ...?');
    }
    return true;
  }

  final _averageCalculator = new averageCalculator();

  final firstTrim = new TextEditingController();

  final secondTrim = new TextEditingController();

  final thirdTrim = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Secondair حساب معدل ',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Kufi', fontSize: 15, fontWeight: FontWeight.bold),
        ),
        leading: InkWell(
          onTap: () {
            try {
              _interstitlaAds.interstitialAd.show();
            } catch (ex) {
              print('ops...');
              print('something weng wrong, ads faild to load ...?');
            }
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 00.0, horizontal: 10.00),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color.fromARGB(255, 39, 109, 75)),
                      child: Column(
                        children: [
                          Center(
                            child: Text('Secondair معدل',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Kufi',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ),
                          //( )
                          Center(
                            child: Text(
                                'هو المعدل الأدنى الذي يجب أن تتحصل عليه في شهادة التعليم المتوسط لضمان الإنتقال إلى السنة أولى ثانوي',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Kufi',
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Center(
                            child: Text(
                                '(كلما كان هذا المعدل أقل من 10 فهذا جيد لك) ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Kufi',
                                    color: Colors.orange,
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                  ),
                  Table(
                    border: TableBorder(
                        horizontalInside: BorderSide(
                            width: 1,
                            color: Colors.green,
                            style: BorderStyle.solid)),
                    columnWidths: const <int, TableColumnWidth>{
                      0: FlexColumnWidth(),
                      1: FlexColumnWidth(),
                      //2: FixedColumnWidth(64),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: <TableRow>[
                      TableRow(children: <Widget>[
                        Container(
                          color: Colors.green,
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height / 25,
                          child: Text('الفصل الدراسي',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Kufi',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          color: Colors.green,
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height / 25,
                          child: Text('المعدل',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Kufi',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                        )
                      ])
                    ],
                  ),
                  Form(
                      child: Column(
                    children: [
                      Table(
                        columnWidths: const <int, TableColumnWidth>{
                          0: FlexColumnWidth(),
                          1: FlexColumnWidth(),
                          //2: FixedColumnWidth(64),
                        },
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: <TableRow>[
                          TableRow(children: <Widget>[
                            Text('الفصل الأول',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Kufi',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            TextFormField(
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              inputFormatters: [
                                CustomRangeTextInputFormatter(),
                              ],
                              controller: firstTrim,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.green,
                              //keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: '... /20',
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                border: UnderlineInputBorder(),
                              ),
                            )
                          ]),
                          TableRow(children: <Widget>[
                            Text('الفصل الثاني',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Kufi',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            TextFormField(
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              inputFormatters: [
                                CustomRangeTextInputFormatter(),
                              ],
                              controller: secondTrim,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.green,
                              //keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: '... /20',
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                border: UnderlineInputBorder(),
                              ),
                            )
                          ]),
                          TableRow(children: <Widget>[
                            Text('الفصل الثالث',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Kufi',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            TextFormField(
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              inputFormatters: [
                                CustomRangeTextInputFormatter(),
                              ],
                              controller: thirdTrim,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.green,
                              //keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: '... /20',
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                border: UnderlineInputBorder(),
                              ),
                            )
                          ])
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 35,
                      ),
                      // ok button
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: Colors.green,
                          width: 1.0, // Underline thickness
                        ))),
                        width: MediaQuery.of(context).size.width / 8,
                        height: MediaQuery.of(context).size.height / 20,
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                String _firstTrim = firstTrim.text.toString();
                                double _firstTrim_ =
                                    double.tryParse(_firstTrim);

                                String _secondTrim = secondTrim.text.toString();

                                double _secondTrim_ =
                                    double.tryParse(_secondTrim);

                                String _thirdTrim = thirdTrim.text.toString();
                                double _thirdTrim_ =
                                    double.tryParse(_thirdTrim);

                                // test here
                                List<double> secondairAvergae;
                                try {
                                  secondairAvergae =
                                      _averageCalculator.secondairAverage(
                                    _firstTrim_,
                                    _secondTrim_,
                                    _thirdTrim_,
                                  );
                                } catch (e) {
                                  print('something went here -> ');
                                  print(e);
                                  return AlertDialog(
                                    content: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                3,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Text('  حدث خطأ ما  ',
                                                  style: new TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.045,
                                                    color: Colors.red,
                                                    fontFamily: 'Kufi',
                                                  )),
                                            ),
                                            Center(
                                              child: Text(
                                                  '  تأكد من إدخال معدلات الفصول الثلاث -',
                                                  style: new TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.015,
                                                    color: Colors.white,
                                                    fontFamily: 'Kufi',
                                                  )),
                                            ),
                                            Center(
                                              child: Text(
                                                  'جميع المعدلات يجب أن تكون بين  0 و  20 -',
                                                  style: new TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.015,
                                                    color: Colors.white,
                                                    fontFamily: 'Kufi',
                                                  )),
                                            )
                                          ],
                                        )),
                                  );
                                }
                                return AlertDialog(
                                  content: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              3,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Text(''),
                                          ),
                                          secondairAvergae.elementAt(0) >= 10
                                              ? Center(
                                                  child: Column(children: [
                                                    Text(
                                                        secondairAvergae
                                                                .elementAt(0)
                                                                .toStringAsFixed(
                                                                    2) +
                                                            ' المعدل السنوي',
                                                        style: new TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.020,
                                                          color: Colors.green,
                                                          fontFamily: 'Kufi',
                                                        )),
                                                    Text(
                                                        'يكفي أن تتحصل على معدل ' +
                                                            secondairAvergae
                                                                .elementAt(1)
                                                                .toStringAsFixed(
                                                                    2) +
                                                            ' في شهادة التعليم المتوسط لتظمن النجاح الى السنة أولى ثانوي ',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: new TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.018,
                                                          color: Colors.green,
                                                          fontFamily: 'Kufi',
                                                        ))
                                                  ]),
                                                )
                                              : Center(
                                                  child: Column(children: [
                                                    Text(
                                                        secondairAvergae
                                                                .elementAt(0)
                                                                .toStringAsFixed(
                                                                    2) +
                                                            '  المعدل السنوي  ',
                                                        style: new TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.020,
                                                          color: Colors.orange,
                                                          fontFamily: 'Kufi',
                                                        )),
                                                    Text(
                                                        'معدلك العام أقل من 10  يكفي أن تتحصل على معدل 10/20 في شهادة التعليم المتوسط لتظمن النجاح الى السنة أولى ثانوي ',
                                                        style: new TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.012,
                                                          color: Colors.green,
                                                          fontFamily: 'Kufi',
                                                        ))
                                                  ]),
                                                ),
                                        ],
                                      )),
                                );
                              },
                            );
                          },
                          child: Ink(
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.15,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                alignment: Alignment.center,
                                child: Text(
                                  'OK   ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Kufi'),
                                )),
                          ),
                        ),
                      )
                    ],
                  ))
                ],
              ))),
    );
  }
}

class CustomRangeTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == '')
      return TextEditingValue();
    else if (double.parse(newValue.text) < 0)
      return TextEditingValue().copyWith(text: '0');

    return double.parse(newValue.text) > 20
        ? TextEditingValue().copyWith(text: '0')
        : newValue;
  }
}
