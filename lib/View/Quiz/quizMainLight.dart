import 'package:flutter/material.dart';
import 'package:myEduApp/View/Quiz/test.dart';

class quizMainLight extends StatefulWidget {
  String image, textDetail, textButton, year, level;

  quizMainLight(this.image, this.textDetail, this.textButton);
  @override
  _quizMainWidgetState createState() => _quizMainWidgetState();
}

// ignore: camel_case_types
class _quizMainWidgetState extends State<quizMainLight> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 165,
        width: 310,
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.centerLeft,
            image: AssetImage(
              widget.image,
            ),
            //fit: BoxFit.none,
          ),
          gradient: LinearGradient(
            colors: [
              //	52, 67, 90
              Colors.white70,
              Colors.green[800]
              //add more colors for gradient
            ],
            begin: Alignment.topCenter, //begin of the gradient color
            end: Alignment.bottomCenter, //end of the gradient color
            //stops for individual color
            //set the stops number equal to numbers of color
          ),
          borderRadius: BorderRadius.circular(10), //border corner radius
        ),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Container(
                // color: Colors.white,
                // ignore: deprecated_member_use
                child: Text(widget.textDetail,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Kufi',
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                // ignore: deprecated_member_use
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 22, 133, 66),
                    onPrimary: const Color(0xFF63d471),
                  ),
                  onPressed: () {
                    //login_page login_page_ = new login_page();
                    test t = new test();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => t));
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFF166D3B),
                            const Color(0xFF166D3B),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.circular(00.0)),
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: 100.0, minHeight: 35.0), // button size
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.arrow_back_ios_sharp,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                                text: ' ' + widget.textButton,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Kufi',
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
