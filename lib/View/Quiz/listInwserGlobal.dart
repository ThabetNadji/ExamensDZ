// ignore: library_names
library listIwnserGlobal;

import 'package:myEduApp/Model/userInwser.dart';

List<userInwser> userInwserList = new List<userInwser>();

addNewInwser(x) {
  userInwserList.add(x);
}

getUserInwserList() {
  return userInwserList;
}
