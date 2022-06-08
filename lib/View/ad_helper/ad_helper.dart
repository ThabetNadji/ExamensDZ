import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  String IDtestAds = 'ca-app-pub-3940256099942544/6300978111';
  String IDads = 'ca-app-pub-3513162147938588/7942112152';
  static BannerAd myBanner = BannerAd(
    //ca-app-pub-3513162147938588/7942112152 realy id
    //ca-app-pub-3940256099942544/6300978111 test id

    adUnitId: 'ca-app-pub-3513162147938588/7942112152',
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );

  static void disposeAd() {
    myBanner.dispose();
  }
}
