//import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'Controller/GetConroller.dart';
import 'View/ad_helper/AppOpenAdManager.dart';
import 'View/main/MyViewModel.dart';
import 'View/main/myhomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:custom_splash/custom_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'View/main/theme.dart';
//import 'ad_helper/AppLifecycleReactor.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await Firebase.initializeApp();
  SharedPreferences.getInstance().then((prefs) {
    //var isDarkTheme = prefs.getBool("darkTheme") ?? true;
    return runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (BuildContext context) => ThemeProvider(true),
        ),
        ChangeNotifierProvider<MyViewModel>(
          create: (BuildContext context) => MyViewModel(),
        ),
      ],
      child: MyEduApp(),
    ));
  });
}

class MyEduApp extends StatefulWidget {
  @override
  _MyEduAppState createState() => _MyEduAppState();
}

class _MyEduAppState extends State<MyEduApp> with WidgetsBindingObserver {
  //  <------- begin

  AppOpenAdManager appOpenAdManager = AppOpenAdManager();
  bool isPaused = false;

  @override
  void initState() {
    super.initState();
    appOpenAdManager.loadAd();
    appOpenAdManager.showAdIfAvailable();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      isPaused = true;
    }
    if (state == AppLifecycleState.resumed && isPaused) {
      print("Resumed==========================");
      appOpenAdManager.showAdIfAvailable();
      isPaused = false;
    }
  } //  <------- end app open ads

  @override
  Widget build(BuildContext context) {
    Get.put(GetController);

    Widget mainWidget = new MediaQuery(
        data: new MediaQueryData(),
        child: Consumer<ThemeProvider>(
          builder: (context, value, child) {
            return new GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: value.darkTheme,
              home: CustomSplash(
                imagePath: "assets/images/myNewLogo5.png",
                backGroundColor: Color.fromARGB(255, 0, 0, 0),
                animationEffect: 'zoom-in',
                home: HomePage(),
                duration: 2000,
                type: CustomSplashType.StaticDuration,
              ),
            );
          },
        ));
    return mainWidget;
  }
}
