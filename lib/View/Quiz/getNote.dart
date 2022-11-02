// ignore: camel_case_types
class getNote {
  String verryWeak = " ضعيف جدا، إجتهد أكثر"; //  a 0-5
  String weak = " ضعيف "; //  a 6-9
  String medium = " متوسط "; // a 10
  String aboveMedium = " فوق المتوسط "; // a 11 - 12
  String good = " جيد "; // a 13 - 15
  String verryGood = " جيد جدا "; // a 16 - 18
  String excelent = " ممتاز "; // a 19 - 20
  String _note = "";

  getNoteResult(_result) {
    if (_result <= 5) {
      _note = verryWeak;
    } else {
      if (_result >= 6 && _result <= 9) {
        _note = weak;
      } else {
        if (_result == 10) {
          _note = medium;
        } else {
          if (_result == 11 || _result == 12) {
            _note = aboveMedium;
          } else {
            if (_result >= 13 && _result <= 15) {
              _note = good;
            } else {
              if (_result >= 16 && _result <= 18) {
                _note = verryGood;
              } else {
                if (_result == 19 || _result == 20) {
                  _note = excelent;
                }
              }
            }
          }
        }
      }
    }
    return _note;
  }
}
