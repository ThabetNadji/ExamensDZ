import 'package:flutter/material.dart';
import 'View/main/MyViewModel.dart';
import 'View/main/myhomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:custom_splash/custom_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'View/main/theme.dart';

Future<void> main() async {
  // somethig went wrong here (test pull)
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences.getInstance().then((prefs) {
    var isDarkTheme = prefs.getBool("darkTheme") ?? true;
    return runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (BuildContext context) => ThemeProvider(isDarkTheme),
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

class _MyEduAppState extends State<MyEduApp> {
  @override
  Widget build(BuildContext context) {
    Widget testWidget = new MediaQuery(
        data: new MediaQueryData(),
        child: Consumer<ThemeProvider>(
          builder: (context, value, child) {
            return new MaterialApp(
              theme: value.getTheme(),
              home: CustomSplash(
                imagePath: "assets/images/myNewLogo5.png",
                backGroundColor: Color(0xFF323232),
                animationEffect: 'zoom-in',
                home: MyHomePage(),
                duration: 3000,
                type: CustomSplashType.StaticDuration,
              ),
            );
          },
        ));
    return testWidget;
  }
}
