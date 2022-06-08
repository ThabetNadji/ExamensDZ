import 'package:flutter/material.dart';

class probaAverage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            'حساب النقاط اللازمة للحصول على معدل معين في شهادة التعليم المتوسط',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Kufi',
                fontSize: 13,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            Container(
                margin: const EdgeInsets.all(15.0),
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(255, 39, 109, 75)),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 4.75,
                      child: Icon(
                        Icons.warning,
                        size: MediaQuery.of(context).size.width / 8,
                        color: Colors.red,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.75,
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 25,
                          ),
                          Center(
                            child: Text(
                                'هذه الخاصية غير متوفرة الآن، سيتم إضافتها في النسخة القادمة من التطبيق',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Kufi',
                                    fontSize:
                                        MediaQuery.of(context).size.height / 45,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Center(
                            child: Text('(بالتوفيق في شهادة التعليم المتوسط) ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Kufi',
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height / 65,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 20,
                          )
                        ],
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
