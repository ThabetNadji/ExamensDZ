import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:myEduApp/Model/users.dart';
import 'package:myEduApp/View/Quiz/test.dart';
import 'GoogleSingInApi.dart';
import 'userGlobal.dart' as userGlobal;

// ignore: must_be_immutable
class MyProfile extends StatefulWidget {
  users user;
  MyProfile(u) {
    this.user = u;
  }
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Profile',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 32,
          ),
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(widget.user.getPhotoUrl()),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Name: ' + widget.user.getUserName(),
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.height * 0.020,
            ),
          ),
          Text(
            'ID: ' + widget.user.getUserID(),
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.020),
          ),
          SizedBox(
            height: 25,
          ),
          TextButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'تسجيل الخروج',
                    style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                      //color: Colors.orange,
                      fontFamily: 'Kufi',
                    ),
                  ),
                  Icon(
                    Icons.logout,
                    color: Colors.red,
                  )
                ],
              ),
              onPressed: () async {
                /* print('before');
                print(userGlobal.getUserDetails());*/

                //userGlobal.setUserDetails(null); // logout
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => test()));
                userGlobal.getUserInfo().setUserID(null);

                // check which acout type use is connected with facebook or google ?
                if (userGlobal.getIsLoginWithGoogle() == true) {
                  // google acout
                  userGlobal.setIsLoginWithGoogle(false);
                  await GoogleSingInApi.logout();
                  print('is logout from google acout');
                } else {
                  // facebook acout
                  if (userGlobal.getIsLoginWithFacebook() == true) {
                    userGlobal.setIsLoginWithFacebook(false);
                    //userGlobal.setFacebookAccessToken(null);
                    await FacebookAuth.instance.logOut();
                  }
                }
              })
        ],
      ),
    );
  }
}
