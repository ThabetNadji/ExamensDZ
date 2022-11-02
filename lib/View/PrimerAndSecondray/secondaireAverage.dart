import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class secondaireAverage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _secondaireAverage();
}

class _secondaireAverage extends State<secondaireAverage> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(' BEM  حساب معدل   ',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Kufi',
                fontSize: 15,
                fontWeight: FontWeight.bold)),
      ),
      body: Container(
          child: Center(
        child: Text('moyenne calculation'),
      )),
    );
  }
}
