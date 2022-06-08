class quotations {
  String _q1 = 'السعاده هي التلذذ بالمصاعب';
  String _q2 = 'تعلم كيف تدير وقت ضعفك و فراغك';
  String _q3 =
      'لا تفكر كثيرا لكن استغفر كثيرا ، فالله يفتح بالاستغفار ابوابا لاتفتح بالتفكير';
  String _q4 = 'صيد الغزال احلى من اكله';
  String _q5 =
      'ليس هناك أسرار للنجاح. انه نتيجة التحضير، والعمل الجاد، والتعلم من الأخطاء';
  String _q6 = ' الخوف لا يأتي من مصدر خارجي ، الخوف يأتي من الداخل ';
  String _q7 = 'بعض الناس يأخذون أحلامهم معهم إلى القبر';
  String _q8 = 'لا تبكي لأن الأمر قد انتهى ، ابتسم لأنه قد حدث';
  String _q9 = 'إذا تعلمت من فشلك، فهذا يعني إنك لم تفشل أبدًا';
  String _q10 = 'لا تحاول أن تسعى إلى النجاح، ولكن كن إنسانًا ذو قيمة';
  String _q11 = 'قيمة النجاح تكون في نهوضك وقيامك بعد كل أمر تعثرت به';
  String _q12 = 'قد أبدو أنني أسير ببطء، ولكني لم أسر مرة إلى الخلف ';
  String _q13 =
      'عندما أرغب في تكوين فريق للعمل، أبحث دائمًا عن الأفراد الذين يريدون الفوز، لكن حينما لا أجدهم أبحث عن الأفراد الذين يكرهون الهزيمة';
  String _q14 =
      'الشيء الضروري واللازم للنجاح هو التوكل على الله أكثر من المثابرة لأن التوكل على الله يتجاوز ويتخطى كل الصعاب';
  String _q15 =
      'من أهم الأشياء التي تجعلك تنجح في جميع علاقاتك الإنسانية سواء العمل، التجارة  أو الدراسة هو التركيز';
  String _q16 =
      'قال نيلسون مانديلا: إن تفوقه الشديد بالمدرسة لم يكن نتيجة لنبوغه، ولكن راجع إلى الإصرار على النجاح';
  String _q17 =
      'عندما ترى نجاحك قد تحقق عندما فشل الآخرين، فاعلم أنه ليس نجاح إنما فشل ارتدى ثوب النصر ';
  String _q18 =
      'لا أعرف الكثير عن قواعد النجاح، ولكن أعرف أول وأهم قواعد الفشل وهي: محاولتك الدائمة لإرضاء الآخرين ';
  String _q19 = 'الكثير ممن فشلوا لم يدركوا مدى قربهم من النجاح عندما استسلموا';
  String _q20 =
      'من الجيد الاحتفال بالنجاح ولكن الأهم استخلاص العبر والدروس من الفشل ';
  String _q21 = 'النجاح.. هو أن تنتقل من فشل إلى فشل بدون أن تفقد حماسك ';
  List<String> _quotationList = [];

  getQutation(int i) {
    fillQuotationList();
    return _quotationList[i];
  }

  getLenght() {
    return _quotationList.length;
  }

  fillQuotationList() {
    _quotationList.add(_q1);
    _quotationList.add(_q2);
    _quotationList.add(_q3);
    _quotationList.add(_q4);
    _quotationList.add(_q5);
    _quotationList.add(_q6);
    _quotationList.add(_q7);
    _quotationList.add(_q8);
    _quotationList.add(_q9);
    _quotationList.add(_q10);
    _quotationList.add(_q11);
    _quotationList.add(_q12);
    _quotationList.add(_q13);
    _quotationList.add(_q14);
    _quotationList.add(_q15);
    _quotationList.add(_q16);
    _quotationList.add(_q17);
    _quotationList.add(_q18);
    _quotationList.add(_q19);
    _quotationList.add(_q20);
    _quotationList.add(_q21);
  }
}
