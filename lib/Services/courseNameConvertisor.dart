// ignore: camel_case_types
class courseNameConvertisor {
  String subject, trimConv;

  // ignore: non_constant_identifier_names
  convCourseName(String subject_) {
    if (subject_ == 'اللغة العربية') {
      subject = 'arab';
    } else {
      if (subject_ == 'الرياضيات') {
        subject = 'math';
      } else {
        if (subject_ == 'تربية علمية') {
          subject = 'science';
        } else {
          if (subject_ == ' الإسلامية') {
            subject = 'islam';
          } else {
            if (subject_ == 'التربية مدنية') {
              subject = 'madania';
            } else {
              if (subject_ == 'الإجتماعيات') {
                subject = 'geo_hes';
              } else {
                if (subject_ == ' الفرنسية') {
                  subject = 'fr';
                }
                if (subject_ == 'الإنجليزية') {
                  subject = 'eng';
                } else {
                  if (subject_ == 'الفيزياء') {
                    subject = 'phy';
                  } else {
                    if (subject_ == 'الإعلام آلي') {
                      subject = 'info';
                    }
                    if (subject_ == 'علوم الطبيعة') {
                      subject = 'science';
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    return subject;
  }

  convTrim(String trim) {
    if (trim == 'الثلاثي الأول') {
      trimConv = 'first_trim';
    } else {
      if (trim == 'الثلاثي الثاني') {
        trimConv = 'second_trim';
      } else {
        if (trim == 'الثلاثي الثالث') {
          trimConv = 'third_trim';
        }
      }
    }
    return trimConv;
  }
}
