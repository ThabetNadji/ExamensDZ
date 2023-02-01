import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class quizMain extends StatefulWidget {
  String image, textDetail, textButton, year, level;

  quizMain(this.image, this.textDetail, this.textButton);
  @override
  _quizMainWidgetState createState() => _quizMainWidgetState();
}

// ignore: camel_case_types
class _quizMainWidgetState extends State<quizMain> {
  //interstitialADS2 _interstitlaAds2 = interstitialADS2();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.30, //165, //235,
        width: MediaQuery.of(context).size.width * 0.9, //310,
        decoration: BoxDecoration(
          color: Color.fromARGB(199, 0, 0, 0),
          border: Border.all(width: 2, color: Color.fromARGB(179, 37, 37, 37)),
          borderRadius: BorderRadius.circular(7),

          //border corner radius
        ),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Container(
                // color: Colors.white,
                // ignore: deprecated_member_use
                child: Padding(
                    padding: const EdgeInsets.only(
                      left: 7.0,
                      right: 7.0,
                    ),
                    child: Text(widget.textDetail,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                            fontFamily: 'Kufi',
                            fontWeight: FontWeight.bold))),
              ),
            ),
            //Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 30, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(widget.image),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  children: [
                    Spacer(),
                    Column(
                      children: [
                        InkWell(
                          onTap: () => launch(
                              'https://play.google.com/store/apps/details?id=com.examens.quiz_game_dz'),
                          child: Ink(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: ' Bem Quiz Dz',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025, //15,
                                          fontFamily: 'Kufi',
                                          fontWeight: FontWeight.bold)),
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.keyboard_arrow_right,
                                      size: MediaQuery.of(context).size.height *
                                          0.03,
                                      color: Colors.green,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
