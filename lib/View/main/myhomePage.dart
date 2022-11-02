import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:myEduApp/View/main/theme.dart';
import 'package:provider/provider.dart';
import '../PrimerAndSecondray/listCoursesPrimer.dart';
import 'contactUs.dart';
import 'myhomePage2.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ScreenHiddenDrawer> _pages = [];

  TextStyle myTextStyle = TextStyle(
    fontFamily: 'Kufi',
  );

  @override
  void initState() {
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: '',
              baseStyle: myTextStyle,
              selectedStyle: myTextStyle,
              colorLineSelected: Colors.orange),
          HomePage2()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'الصفحة الرئيسية',
              baseStyle: myTextStyle,
              selectedStyle: myTextStyle,
              colorLineSelected: Colors.orange),
          HomePage2()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'أولى متوسط   ',
              baseStyle: myTextStyle,
              selectedStyle: myTextStyle,
              colorLineSelected: Colors.orange),
          ListCoursesPrimer(('أولى متوسط'), ('2_Secondary'))),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'الثانية متوسط   ',
              baseStyle: myTextStyle,
              selectedStyle: myTextStyle,
              colorLineSelected: Colors.orange),
          ListCoursesPrimer(('الثانية متوسط'), ('2_Secondary'))),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'الثالثة متوسط   ',
              baseStyle: myTextStyle,
              selectedStyle: myTextStyle,
              colorLineSelected: Colors.orange),
          ListCoursesPrimer(('الثالثة متوسط'), ('2_Secondary'))),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'الرابعة متوسط   ',
              baseStyle: myTextStyle,
              selectedStyle: myTextStyle,
              colorLineSelected: Colors.orange),
          ListCoursesPrimer(('الرابعة متوسط'), ('2_Secondary'))),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'تواصل معنا   ',
              baseStyle: myTextStyle,
              selectedStyle: myTextStyle,
              colorLineSelected: Colors.orange),
          contactUs())
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, value, child) {
      return new MaterialApp(
          theme: value.getTheme(),
          home: HiddenDrawerMenu(
            backgroundColorContent: Colors.white,
            backgroundMenu: DecorationImage(
              scale: MediaQuery.of(context).size.width / 135,
              alignment: Alignment.topLeft,
              //isAntiAlias: false,
              //fit: BoxFit.contain,
              image: AssetImage("assets/images/myNewLogo5.png"),
            ),
            verticalScalePercent: 75.0,
            contentCornerRadius: 10.0,
            enableShadowItensMenu: true,
            withShadow: true,
            isTitleCentered: true,
            backgroundColorMenu: Color.fromARGB(0, 63, 60, 60),
            initPositionSelected: 1,
            slidePercent: MediaQuery.of(context).size.width / 5.5,
            screens: _pages,
          ));
    });
  }
}
