import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class contactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.40,
      //color: Colors,
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        SizedBox(
          height: MediaQuery.of(context).size.width / 35,
        ),
        Text('-  تواصل معنا ',
            textDirection: TextDirection.rtl,
            style: new TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.018,
                //color: Colors.green,
                fontFamily: 'Kufi',
                fontWeight: FontWeight.bold)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              children: [
                Image(
                  image: const AssetImage('assets/images/facebook_image.jpeg'),
                  height: MediaQuery.of(context).size.height / 15,
                  width: MediaQuery.of(context).size.width / 8,
                ),
                InkWell(
                    child: new Text('صفحتنا على الفايسبوك',
                        style: TextStyle(
                            fontFamily: 'Kufi',
                            fontSize: MediaQuery.of(context).size.width / 35,
                            fontWeight: FontWeight.bold)),
                    onTap: () => launch(
                        'https://www.facebook.com/profile.php?id=100067791386888')),
              ],
            ),
            Column(
              children: [
                Image(
                  image: const AssetImage('assets/images/at.png'),
                  height: MediaQuery.of(context).size.height / 15,
                  width: MediaQuery.of(context).size.width / 8,
                ),
                Column(
                  children: [
                    Text('البريد الإلكتروني',
                        style: TextStyle(
                            fontFamily: 'Kufi',
                            fontSize: MediaQuery.of(context).size.width / 35,
                            fontWeight: FontWeight.bold)),
                    SelectableText('myeducappse@gmail.com',
                        style: TextStyle(
                            fontFamily: 'Kufi',
                            fontSize: MediaQuery.of(context).size.width / 35,
                            color: Colors.green,
                            fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: InkWell(
              child: new Text(' سياسة الخصوصية -',
                  style: TextStyle(
                      fontFamily: 'Kufi',
                      fontSize: MediaQuery.of(context).size.width / 28,
                      fontWeight: FontWeight.bold)),
              onTap: () => launch(
                  'https://examensdz.blogspot.com/2021/05/privacy-policy-nadji-thabet-built.html')),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: InkWell(
              child: new Text(' قيمنا على متجر التطبيقات -',
                  style: TextStyle(
                      fontFamily: 'Kufi',
                      fontSize: MediaQuery.of(context).size.width / 28,
                      fontWeight: FontWeight.bold)),
              onTap: () => launch(
                  'https://play.google.com/store/apps/details?id=com.Moyenne.ExamensDZ')),
        ),
      ]),
    );
  }
}
