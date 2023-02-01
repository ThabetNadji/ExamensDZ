import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:myEduApp/Controller/GetConroller.dart';
import '../../Services/averageCalculator.dart';
import '../ad_helper/interstitialAds.dart';
import 'subjectsToChoice.dart';
import 'tableRow1.dart';

// ignore: must_be_immutable
class bemAverage extends GetView<GetController> {
  //final GetController gc = Get.put(GetController());
  final _formKey = new GlobalKey();
  final arabController = new TextEditingController();
  final mathController = new TextEditingController();
  final hestoController = TextEditingController();
  final scienceController = TextEditingController();
  final phyController = TextEditingController();
  final frController = TextEditingController();
  final engController = TextEditingController();
  final islmController = TextEditingController();
  final civilController = TextEditingController();
  final amzghController = TextEditingController();
  final sportController = TextEditingController();
  final artController = TextEditingController();
  interstitlaAds _interstitlaAds = interstitlaAds();

  Widget build(BuildContext context) {
    averageCalculator _averageCalculator = new averageCalculator();

    // go back button override
    Future<bool> _onWillPop() async {
      Navigator.pop(context);
      try {
        _interstitlaAds.interstitialAd.show();
      } catch (ex) {
        print('ops...');
        print('something went wrong, ads faild to load ...?');
      }
      return true;
    }

    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: Text(' BEM  حساب معدل   ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Kufi',
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
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
              )),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            child: Center(
                child: SingleChildScrollView(
              child: Column(children: [
                // parameter checkbox  // checked button
                Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 00.0, horizontal: 10.00),
                    height: MediaQuery.of(context).size.height / 10.5,
                    child: subjectToChoise()),

                SizedBox(
                  height: 10,
                ),

                // note, coe and result
                Table(
                  border: TableBorder(
                      horizontalInside: BorderSide(
                          width: 1,
                          color: Colors.green,
                          style: BorderStyle.solid)),
                  columnWidths: const <int, TableColumnWidth>{
                    0: FlexColumnWidth(),
                    1: FlexColumnWidth(),
                    2: FixedColumnWidth(64),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: <TableRow>[
                    TableRow(
                      children: <Widget>[
                        Container(
                          color: Colors.green,
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height / 25,
                          child: Text('المادة',
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
                          child: Text('العلامة',
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
                          child: Text('المعامل',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Kufi',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ],
                ),
                // textField table (main table)
                Form(
                    //key: _formKey,
                    child: Column(
                  children: [
                    Table(
                      border: TableBorder(
                          /*horizontalInside: BorderSide(
                      width: 1,
                      color: Colors.orange,
                      style: BorderStyle.solid)*/
                          ),
                      columnWidths: const <int, TableColumnWidth>{
                        0: FlexColumnWidth(),
                        1: FlexColumnWidth(),
                        2: FixedColumnWidth(64),
                      },
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: <TableRow>[
                        TableRow(children: <Widget>[
                          tableRowOne('  لغة عربية  ', Icons.auto_stories),
                          TextFormField(
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            inputFormatters: [
                              CustomRangeTextInputFormatter(),
                            ],
                            controller: arabController,
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
                          ),
                          tableRowThree('5'),
                        ]),
                        TableRow(children: <Widget>[
                          tableRowOne('  رياضيات  ', Icons.calculate),
                          TextFormField(
                            inputFormatters: [
                              CustomRangeTextInputFormatter(),
                            ],
                            controller: mathController,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.green,
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
                          ), // textField
                          tableRowThree('4'),
                        ]),
                        TableRow(children: <Widget>[
                          tableRowOne('  إجتماعيات  ', Icons.explore),
                          TextFormField(
                            inputFormatters: [
                              CustomRangeTextInputFormatter(),
                            ],
                            controller: hestoController,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.green,
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
                          ),
                          tableRowThree('3'),
                        ]),
                        TableRow(children: <Widget>[
                          tableRowOne('  علوم طبيعية  ', Icons.biotech_sharp),
                          TextFormField(
                            inputFormatters: [
                              CustomRangeTextInputFormatter(),
                            ],
                            controller: scienceController,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.green,
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
                          ),
                          tableRowThree('2'),
                        ]),
                        TableRow(children: <Widget>[
                          tableRowOne('  فيزياء  ', Icons.science_outlined),
                          TextFormField(
                            inputFormatters: [
                              CustomRangeTextInputFormatter(),
                            ],
                            controller: phyController,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.green,
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
                          ),
                          tableRowThree('2'),
                        ]),
                        TableRow(children: <Widget>[
                          tableRowOne('  فرنسية  ', Icons.language),
                          TextFormField(
                            inputFormatters: [
                              CustomRangeTextInputFormatter(),
                            ],
                            controller: frController,
                            textAlign: TextAlign.center,
                            cursorColor: Colors.green,
                            keyboardType: TextInputType.number,
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
                          ),
                          tableRowThree('3'),
                        ]),
                        TableRow(children: <Widget>[
                          tableRowOne('  إنجليزية  ', Icons.g_translate_sharp),
                          TextFormField(
                            inputFormatters: [
                              CustomRangeTextInputFormatter(),
                            ],
                            controller: engController,
                            textAlign: TextAlign.center,
                            cursorColor: Colors.green,
                            keyboardType: TextInputType.number,
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
                          ),
                          tableRowThree('2'),
                        ]),
                        TableRow(children: <Widget>[
                          tableRowOne(
                              '  إسلامية  ', Icons.brightness_low_outlined),
                          TextFormField(
                            inputFormatters: [
                              CustomRangeTextInputFormatter(),
                            ],
                            controller: islmController,
                            textAlign: TextAlign.center,
                            cursorColor: Colors.green,
                            keyboardType: TextInputType.number,
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
                          ),
                          tableRowThree('2'),
                        ]),
                        TableRow(children: <Widget>[
                          tableRowOne('  تربية مدنية  ',
                              Icons.account_balance_outlined),
                          TextFormField(
                            inputFormatters: [
                              CustomRangeTextInputFormatter(),
                            ],
                            controller: civilController,
                            textAlign: TextAlign.center,
                            cursorColor: Colors.green,
                            keyboardType: TextInputType.number,
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
                          ),
                          tableRowThree('1'),
                        ]),
                        TableRow(children: <Widget>[
                          tableRowOne('  لغة أمازيغية  ',
                              Icons.admin_panel_settings_sharp),
                          GetBuilder<GetController>(
                              init: GetController(),
                              builder: (gc) => TextFormField(
                                    inputFormatters: [
                                      CustomRangeTextInputFormatter(),
                                    ],
                                    controller: amzghController,
                                    enabled: gc.isCheckedAmazighe,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    cursorColor: Colors.green,
                                    decoration: InputDecoration(
                                      hintText: gc.isCheckedAmazighe == false
                                          ? 'غير محتسب'
                                          : '... /20',
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.orange),
                                      ),
                                      border: UnderlineInputBorder(),
                                    ),
                                  )),
                          tableRowThree('2'),
                        ]),
                        TableRow(children: <Widget>[
                          tableRowOne('  تربية بدنية  ', Icons.sports_score),
                          GetBuilder<GetController>(
                              init: GetController(),
                              builder: (gc) => TextFormField(
                                    inputFormatters: [
                                      CustomRangeTextInputFormatter(),
                                    ],
                                    controller: sportController,
                                    enabled: gc.isCheckedSport,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    cursorColor: Colors.green,
                                    decoration: InputDecoration(
                                      hintText: gc.isCheckedSport == false
                                          ? 'غير محتسب'
                                          : '... /20',
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.orange),
                                      ),
                                      border: UnderlineInputBorder(),
                                    ),
                                  )),
                          tableRowThree('1'),
                        ]),
                        TableRow(children: <Widget>[
                          tableRowOne('  تربية فنية   ', Icons.art_track),
                          GetBuilder<GetController>(
                              init: GetController(),
                              builder: (gc) => TextFormField(
                                    inputFormatters: [
                                      CustomRangeTextInputFormatter(),
                                    ],
                                    controller: artController,
                                    enabled: gc.isCheckedArt,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    cursorColor: Colors.green,
                                    decoration: InputDecoration(
                                      hintText: gc.isCheckedArt == false
                                          ? 'غير محتسب'
                                          : '... /20',
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.orange),
                                      ),
                                      border: UnderlineInputBorder(),
                                    ),
                                  )),
                          tableRowThree('/'),
                        ])
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    // OK button (calculation)
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Colors.green,
                        width: 1.0, // Underline thickness
                      ))),
                      width: MediaQuery.of(context).size.width / 6,
                      height: MediaQuery.of(context).size.height / 20,
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              String _arabController =
                                  arabController.text.toString();
                              double _arabController_ =
                                  double.tryParse(_arabController);

                              String _mathController =
                                  mathController.text.toString();

                              double _mathController_ =
                                  double.tryParse(_mathController);

                              String _hestoController =
                                  hestoController.text.toString();
                              double _hestoController_ =
                                  double.tryParse(_hestoController);

                              String _scienceController =
                                  scienceController.text.toString();
                              double _scienceController_ =
                                  double.tryParse(_scienceController);

                              String _phyController =
                                  phyController.text.toString();
                              double _phyController_ =
                                  double.tryParse(_phyController);

                              String _islmController =
                                  islmController.text.toString();
                              double _islmController_ =
                                  double.tryParse(_islmController);

                              String _civilController =
                                  civilController.text.toString();
                              double _civilController_ =
                                  double.tryParse(_civilController);

                              String _engController =
                                  engController.text.toString();
                              double _engController_ =
                                  double.tryParse(_engController);

                              String _frController =
                                  frController.text.toString();
                              double _frController_ =
                                  double.tryParse(_frController);

                              String _sportController =
                                  sportController.text.toString();
                              double _sportController_ =
                                  double.tryParse(_sportController);

                              String _artController =
                                  artController.text.toString();
                              double _artController_ =
                                  double.tryParse(_artController);

                              String _amzghController =
                                  amzghController.text.toString();
                              double _amzghController_ =
                                  double.tryParse(_amzghController);
                              // test here
                              double average = 0;
                              try {
                                average = _averageCalculator.averageCalculator_(
                                    _arabController_,
                                    _mathController_,
                                    _hestoController_,
                                    _scienceController_,
                                    _phyController_,
                                    _islmController_,
                                    _civilController_,
                                    _engController_,
                                    _frController_,
                                    _sportController_,
                                    _artController_,
                                    _amzghController_);
                              } catch (e) {
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
                                                '  تأكد من إدخال علامات جميع  المواد -',
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
                                                'جميع العلامات يجب أن تكون بين  0 و  20 -',
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
                                        MediaQuery.of(context).size.height / 3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child:
                                              Text('معدل شهادة التعليم المتوسط',
                                                  style: new TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.020,
                                                    color: Colors.white,
                                                    fontFamily: 'Kufi',
                                                  )),
                                        ),
                                        Center(
                                          child:
                                              Text(average.toStringAsFixed(2),
                                                  style: new TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.025,
                                                    color: Colors.white,
                                                    fontFamily: 'Kufi',
                                                  )),
                                        ),
                                        double.tryParse(average
                                                    .toStringAsFixed(2)) >=
                                                10.00
                                            ? Center(
                                                child: Text(' ناجح، ألف مبروك ',
                                                    style: new TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.020,
                                                      color: Colors.green,
                                                      fontFamily: 'Kufi',
                                                    )),
                                              )
                                            : Center(
                                                child: Text(
                                                    ' راسب، حظ أوفر العام القادم',
                                                    style: new TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.015,
                                                      color: Colors.orange,
                                                      fontFamily: 'Kufi',
                                                    )),
                                              )
                                      ],
                                    )),
                              );
                            },
                          );
                        },
                        child: Ink(
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: MediaQuery.of(context).size.height * 0.15,
                              alignment: Alignment.center,
                              child: Text(
                                'OK  ',
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
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                )),
              ]),
            )),
          ),
        ));
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
