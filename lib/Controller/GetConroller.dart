import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class GetController extends GetxController {
  bool isCheckedSport = true;
  bool isCheckedArt = true;
  bool isCheckedAmazighe = false;

  void setIsCheckedSport(bool b) {
    isCheckedSport = b;
    update();
  }

  void setIsCheckedArt(bool b) {
    isCheckedArt = b;
    update();
  }

  void setIsCheckedAmazighe(bool b) {
    isCheckedAmazighe = b;
    update();
  }
}
