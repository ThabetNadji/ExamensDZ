// ignore: library_names
library userGlobal;

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:myEduApp/Model/userInwser.dart';
import 'package:myEduApp/Model/users.dart';

List<userInwser> userAnwserList = new List<userInwser>();
users userInfo = new users();
String examName;
String trimester;
String examNum;
bool isLoginWithGoogle = false;
bool isLoginWithFacebook = false;
AccessToken _accessToken;

getFacebookAccessToken() {
  return _accessToken;
}

setFacebookAccessToken(act) {
  _accessToken = act;
}

getIsLoginWithGoogle() {
  return isLoginWithGoogle;
}

setIsLoginWithGoogle(bool b) {
  isLoginWithGoogle = b;
}

getIsLoginWithFacebook() {
  return isLoginWithFacebook;
}

setIsLoginWithFacebook(bool b) {
  isLoginWithFacebook = b;
}

// geters and seters for name ,trimester ,season
// name
getExamName() {
  return examName;
}

setExamName(String name) {
  examName = name;
}

// trimester
getTrimester() {
  return trimester;
}

setTrimester(String trim) {
  trimester = trim;
}

// examNum
getExamNum() {
  return examNum;
}

setExamNum(String _num) {
  examNum = _num;
}

// userAnwser
addNewAnwser(x) {
  userAnwserList.add(x);
}

List<userInwser> getUserInwserList() {
  return userAnwserList;
}

setUserInwserList(emplyList) {
  userAnwserList = emplyList;
}

// userInfo
users getUserInfo() {
  return userInfo;
}

setUserInfo(users u) {
  userInfo = u;
}
