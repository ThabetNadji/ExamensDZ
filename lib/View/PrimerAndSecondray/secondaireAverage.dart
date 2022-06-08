import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../ad_helper/ad_helper.dart';

class secondaireAverage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _secondaireAverage();
}

class _secondaireAverage extends State<secondaireAverage> {
  @override
  void initState() {
    AdHelper.disposeAd();
    AdHelper.myBanner.load();
    super.initState();
  }

  AdWidget adWidget = AdWidget(ad: AdHelper.myBanner);
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
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.black38,
        child: adWidget,
      ),
      body: Container(
          child: Center(
        child: Text('moyenne calculation'),
      )),
    );
  }
}
