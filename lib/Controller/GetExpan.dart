import 'package:get/get.dart';

class GetExpan extends GetxController {
  bool isExpand = true;

  void setIsExpand(bool b) {
    isExpand = b;
    update();
  }
}
