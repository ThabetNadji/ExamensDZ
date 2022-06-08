import 'package:myEduApp/Controller/GetConroller.dart';
import 'package:get/get.dart';

class averageCalculator {
  final GetController gc = Get.put(GetController());

  double averageCalculator_(
      double arab,
      double math,
      double geo,
      double science,
      double phys,
      double islam,
      double civil,
      double eng,
      double fr,
      double sport,
      double art,
      double amazigh) {
    double average = 0.0;
    // 1 => all true
    if (gc.isCheckedAmazighe == true &&
        gc.isCheckedSport == true &&
        gc.isCheckedArt == true) {
      double s = arab * 5 +
          math * 4 +
          geo * 3 +
          science * 2 +
          phys * 2 +
          islam * 2 +
          civil +
          eng * 2 +
          fr * 3 +
          sport +
          (art - 10) +
          amazigh * 2;
      average = s / 27;
    } else {
      // 2 => amazigh false
      if ((gc.isCheckedAmazighe == false &&
          gc.isCheckedSport == true &&
          gc.isCheckedArt == true)) {
        double s1 = arab * 5 +
            math * 4 +
            geo * 3 +
            science * 2 +
            phys * 2 +
            islam * 2 +
            civil +
            eng * 2 +
            fr * 3 +
            sport +
            (art - 10);
        average = s1 / 25;
      } else {
        // 3 => (only art true) amazigh, sport false
        if (gc.isCheckedAmazighe == false &&
            gc.isCheckedSport == false &&
            gc.isCheckedArt == true) {
          double s2 = arab * 5 +
              math * 4 +
              geo * 3 +
              science * 2 +
              phys * 2 +
              islam * 2 +
              civil +
              eng * 2 +
              fr * 3 +
              (art - 10);
          average = s2 / 24;
        } else {
          // 4 => all false
          if ((gc.isCheckedAmazighe == false &&
              gc.isCheckedSport == false &&
              gc.isCheckedArt == false)) {
            double s3 = arab * 5 +
                math * 4 +
                geo * 3 +
                science * 2 +
                phys * 2 +
                islam * 2 +
                civil +
                eng * 2 +
                fr * 3;
            average = s3 / 24;
          } else {
            // 5 => only amazigh true (amazighen do amazigh)
            if (gc.isCheckedAmazighe == true &&
                gc.isCheckedSport == false &&
                gc.isCheckedArt == false) {
              double s4 = arab * 5 +
                  math * 4 +
                  geo * 3 +
                  science * 2 +
                  phys * 2 +
                  islam * 2 +
                  civil +
                  eng * 2 +
                  fr * 3 +
                  amazigh * 2;
              average = s4 / 26;
            } else {
              // 6 => only sport false
              if (gc.isCheckedAmazighe == true &&
                  gc.isCheckedSport == false &&
                  gc.isCheckedArt == true) {
                double s4 = arab * 5 +
                    math * 4 +
                    geo * 3 +
                    science * 2 +
                    phys * 2 +
                    islam * 2 +
                    civil +
                    eng * 2 +
                    fr * 3 +
                    amazigh * 2 +
                    (art - 10);
                average = s4 / 26;
              } else {
                // 7 => only sport true ?
                if (gc.isCheckedAmazighe == false &&
                    gc.isCheckedSport == true &&
                    gc.isCheckedArt == false) {
                  double s4 = arab * 5 +
                      math * 4 +
                      geo * 3 +
                      science * 2 +
                      phys * 2 +
                      islam * 2 +
                      civil +
                      eng * 2 +
                      fr * 3 +
                      sport;
                  average = s4 / 25;
                } else {
                  // 8 => only art false
                  if (gc.isCheckedAmazighe == true &&
                      gc.isCheckedSport == true &&
                      gc.isCheckedArt == false) {
                    double s4 = arab * 5 +
                        math * 4 +
                        geo * 3 +
                        science * 2 +
                        phys * 2 +
                        islam * 2 +
                        civil +
                        eng * 2 +
                        fr * 3 +
                        amazigh * 2 +
                        sport;
                    average = s4 / 27;
                  }
                }
              }
            }
          }
        }
      }
    }
    if (average < 0) {
      return 0.00;
    } else {
      return average;
    }
  }

  List<double> secondairAverage(double a, double b, double c) {
    double ovrealAverage = a + b + c;
    double secondaireAverage = ovrealAverage / 3;
    List<double> averageList = [];

    averageList.add(ovrealAverage / 3); // elementAt 0
    averageList.add(20 - secondaireAverage); // elementAt 1
    return averageList;
  }
}
