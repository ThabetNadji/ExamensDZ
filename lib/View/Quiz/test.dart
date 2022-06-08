// ignore: camel_case_types
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:myEduApp/Model/users.dart';
import 'package:myEduApp/Services/quizServices.dart';
import 'package:myEduApp/View/main/NetworkCheck.dart';
import '../ad_helper/ad_helper.dart';
import 'GoogleSingInApi.dart';
import 'LoggedInPage.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'userGlobal.dart' as userGlobal;

// ignore: camel_case_types
class test extends StatefulWidget {
  test();
  @override
  login_pageWidgetState createState() => login_pageWidgetState();
}

// ignore: camel_case_types
class login_pageWidgetState extends State<test> {
  // set ads
  @override
  void initState() {
    // TODO: implement initState
    AdHelper.disposeAd();
    AdHelper.myBanner.load();
    super.initState();
  }

  AdWidget adWidget = AdWidget(ad: AdHelper.myBanner);
  // and set ads
  NetworkCheck networkChecker = new NetworkCheck();
  String emailToCheck;
  quizServices _quizServices = new quizServices();
  var accessToken;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('QuizGame'),
        ),
        bottomNavigationBar: Container(
          height: 50,
          color: Colors.black38,
          child: adWidget,
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    alignment: Alignment.center,
                    image: AssetImage(
                      'assets/images/myNewLogo5.png',
                    ),
                    //fit: BoxFit.none,
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text(
                            ' مرحبا ،قم بتسجيل الدخول باستخدام حسابك غوغل أو فيسبوك',
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.0,
                              //color: Colors.orange,
                              fontFamily: 'Kufi',
                            )))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                // intenet verification
                FutureBuilder(
                  future: networkChecker.isInternet(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.toString() == 'true') {
                        // there is an internet connection
                        return Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                FutureBuilder(
                                  future: googleSingIn(context),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      googleSingIn(context);
                                      return null;
                                    } else {
                                      return Text('something went wrong ...');
                                    }
                                  },
                                );
                                //googleSingIn(context);
                              },
                              child: Ink(
                                color: Color(0xFF397AF3),
                                child: Padding(
                                  padding: EdgeInsets.all(6),
                                  child: Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      Tab(
                                        icon: new Image.asset(
                                            'assets/images/google_image.png'),
                                      ), // <-- Use 'Image.asset(...)' here
                                      SizedBox(width: 12),
                                      Text('      Sign in with Google   '),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // add connection verification
                            InkWell(
                              onTap: () async {
                                // call facebook login
                                FutureBuilder(
                                  future: facebookSignin(context),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      facebookSignin(context);
                                      return null;
                                    } else {
                                      return Text('something went wrong ...');
                                    }
                                  },
                                );
                                //facebookSignin(context);
                              },
                              child: Ink(
                                color: Color(0xFF3c599f),
                                child: Padding(
                                  padding: EdgeInsets.all(6),
                                  child: Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      Tab(
                                        icon: new Image.asset(
                                            'assets/images/facebook_image.jpeg'),
                                      ), // <-- Use 'Image.asset(...)' here
                                      SizedBox(width: 12),
                                      Text('Sign in with Facebook'),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      } else {
                        // snapshot.data.toString() == false
                        return Text(
                          'لا يوجد إتصال بالأنترنت',
                          style: TextStyle(
                              fontFamily: 'Kufi',
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              color: Colors.orange),
                        );
                      }
                    } else {
                      // snapshot.data == null
                      return Center(
                          child: Column(
                        children: [
                          CupertinoActivityIndicator(),
                          SizedBox(
                            height: 30,
                          ),
                          Text('... إنتظر قليلا ',
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                                color: Colors.orange,
                                fontFamily: 'Kufi',
                              )),
                        ],
                      ));
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }

// google loing
  googleSingIn(context) async {
    // ignore: non_constant_identifier_names
    final googleUser = await GoogleSingInApi.login();
    //userGlobal.setUserDetails(googleUser); // <------- ?
    emailToCheck = googleUser.email;
    Future googleFutureResult = _quizServices.userIsExist(emailToCheck);
    userChecked(googleFutureResult, googleUser.displayName, googleUser.photoUrl,
        context);
    userGlobal.setIsLoginWithGoogle(true);
  }

// facebook login
  facebookSignin(context) async {
    FacebookAuth.instance
        .login(permissions: ['public_profile', 'email']).then((userData) {
      FacebookAuth.instance.getUserData().then((userData) {
        setState(() {
          // 1- process to extract pictureURL
          Map<String, dynamic> picture;
          picture = userData['picture'];
          Map<String, dynamic> dataPicture;
          dataPicture = picture['data'];
          String facebookPictureUrl = dataPicture['url'];
          String facebookUserName = userData['name'];

          if (userData['email'] != null) {
            emailToCheck = userData['email'];
            print('email not null');
            Future facebookFutureResult =
                _quizServices.userIsExist(emailToCheck);
            userChecked(facebookFutureResult, facebookUserName,
                facebookPictureUrl, context);
          } else {
            emailToCheck = userData['id'];
            print('email is null');
            Future facebookFutureResult =
                _quizServices.userIsExist(emailToCheck);
            userChecked(facebookFutureResult, facebookUserName,
                facebookPictureUrl, context);
          }
        });
      });
    });

    userGlobal.setIsLoginWithFacebook(true);
  }

// function to check if user is already exist in the database or not
  void userChecked(
      Future<dynamic> futureResult, String name, String photoUrl, context) {
    futureResult.then((result) {
      // user exist and -> user login and logout and login another more time
      if (result.getUserID() != 'nullID') {
        users us0 = new users();
        // prepare user info
        us0.setUserID(emailToCheck); // email or semething else
        us0.setUserName(name); // userName
        us0.setPhotoUrl(photoUrl); // photoUrl
        us0.setScore(result.getScore()); // score
        // and user info prepare

        userGlobal.setUserInfo(us0); // <--------- set a info to the new user

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoggedInPage(us0)));
      } else {
        //  user login for the first time so its a new user
        users us1 = new users();
        // prepare user info
        us1.setUserID(emailToCheck); // email or id
        us1.setUserName(name); // userName
        us1.setPhotoUrl(photoUrl); // photoUrl
        us1.setScore(0); // score == 0  by default score is 0
        // and user info prepare

        userGlobal.setUserInfo(us1); //  <--------- set a info to the new user

        _quizServices.addNewUser(us1.getUserID(), us1.getUserName()); //saveUser
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoggedInPage(us1)));
      }
    });
  }
}
