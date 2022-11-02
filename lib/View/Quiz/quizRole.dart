import 'package:flutter/material.dart';

class quizRole extends StatelessWidget {
  const quizRole({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text('قواعد الإختبار و سلم التنقيط',
            textDirection: TextDirection.rtl,
            style: new TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.018,
                //color: Colors.green,
                fontFamily: 'Kufi',
                fontWeight: FontWeight.bold)),
      ),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.40,
        //color: Colors,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('كل إختبار يتكون من 10 أسئلة',
                textDirection: TextDirection.rtl,
                style: new TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.012,
                    //color: Colors.green,
                    fontFamily: 'Kufi',
                    fontWeight: FontWeight.bold)),
            Text('كل سؤال لديه أربعة أجوبة مقترحة',
                textDirection: TextDirection.rtl,
                style: new TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.012,
                    //color: Colors.green,
                    fontFamily: 'Kufi',
                    fontWeight: FontWeight.bold)),
            Text(
                'من بين الأربعة أجوبة المقترحة لكل سؤال, توجد إجابة واحدة فقط صحيحة',
                textDirection: TextDirection.rtl,
                style: new TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.012,
                    //color: Colors.green,
                    fontFamily: 'Kufi',
                    fontWeight: FontWeight.bold)),
            Text('كل إجابة صحيحة تحسب 2+ نقطة ',
                textDirection: TextDirection.rtl,
                style: new TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.012,
                    color: Colors.green,
                    fontFamily: 'Kufi',
                    fontWeight: FontWeight.bold)),
            Text('كل اجابة خاطئة تحتسب 1- نقطة',
                textDirection: TextDirection.rtl,
                style: new TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.012,
                    color: Colors.red,
                    fontFamily: 'Kufi',
                    fontWeight: FontWeight.bold)),
            Text(
                'إذا كنت غير متؤكد من الإجابة الصحيحة فلا تقم بالإجابة على السؤال و إنتقل الى السؤال الموالي مباشرة ',
                textDirection: TextDirection.rtl,
                style: new TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.012,
                    color: Colors.orange,
                    fontFamily: 'Kufi',
                    fontWeight: FontWeight.bold)),
            Text(
                'إذا قمت بالإجابة على سؤال ما و إنتقلت الى السؤال الموالي فلا يمكنك العودة الى السؤال السابق',
                textDirection: TextDirection.rtl,
                style: new TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.012,
                    //color: Colors.green,
                    fontFamily: 'Kufi',
                    fontWeight: FontWeight.bold)),
            Text(''),
            Center(
              child: Text('بالــتوفــيق',
                  style: new TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.022,
                      color: Colors.green,
                      fontFamily: 'Kufi',
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}
