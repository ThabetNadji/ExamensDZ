import 'package:flutter/material.dart';
import 'package:myEduApp/View/calculator/probaAverage.dart';

import '../ad_helper/interstitialAds.dart';
import '../calculator/bemAverage.dart';
import '../calculator/secondairAverage.dart';

class horizantalListView extends StatelessWidget {
  interstitlaAds _interstitlaAds = interstitlaAds();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      height: MediaQuery.of(context).size.height / 7.5,
      child: ListView(
        // This next line does the trick.
        reverse: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            //height: MediaQuery.of(context).size.height / 1.2,
            width: MediaQuery.of(context).size.width / 2.2,
            child: Card(
                child: Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width / 15,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      alignment: Alignment.center,
                      image: AssetImage('assets/images/calculator3.png'),
                      //fit: BoxFit.none,
                    ))),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => bemAverage()));
                  },
                  child: Container(
                      child: Text('BEM حساب معدل ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Kufi',
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              fontWeight: FontWeight.bold,
                              color: Colors.green))),
                ),
              ],
            )),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2.2,
            child: Card(
              child: Column(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height / 14,
                      width: MediaQuery.of(context).size.width / 14,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        alignment: Alignment.center,
                        image: AssetImage('assets/images/management.png'),
                        //fit: BoxFit.none,
                      ))),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  secondairAverage()));
                    },
                    child: Container(
                        child: Text('Secondair حساب معدل ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Kufi',
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                fontWeight: FontWeight.bold,
                                color: Colors.green))),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.5,
            child: Card(
                child: Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width / 15,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      alignment: Alignment.center,
                      image: AssetImage('assets/images/idea.png'),
                      //fit: BoxFit.none,
                    ))),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => probaAverage()));
                  },
                  child: Container(
                      child: Text(
                          '  حساب النقاط اللازمة للحصول على معدل معين في شهادة التعليم المتوسط',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Kufi',
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.green))),
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
