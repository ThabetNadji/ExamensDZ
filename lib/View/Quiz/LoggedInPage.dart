import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myEduApp/Model/users.dart';
import 'package:myEduApp/View/Quiz/MyProfile.dart';
import 'package:myEduApp/View/Quiz/quizHome.dart';
import 'package:myEduApp/View/Quiz/statistic.dart';

// ignore: must_be_immutable
class LoggedInPage extends StatefulWidget {
  users user;
  String tesx;
  LoggedInPage(users u) {
    // try to remove type name of the parameter
    this.user = u;
  }
  @override
  _LoggedInPageState createState() => _LoggedInPageState();
}

class _LoggedInPageState extends State<LoggedInPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ExamensDZ Quiz Game",
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.025)),
        actions: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(widget.user.getPhotoUrl()),
          )
        ],
      ),
      body: getBody(),
      bottomNavigationBar: _showBottomNav(),
    );
  }

  Widget getBody() {
    Widget profile = MyProfile(widget.user);
    Widget rank_ = statistic();
    Widget _quizHome = quizHome();
    if (this._selectedIndex == 0) {
      return _quizHome;
    } else if (this._selectedIndex == 1) {
      return rank_;
    } else {
      return profile;
    }
  }

  Widget _showBottomNav() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.school_sharp),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.leaderboard),
          label: 'Statiscitque',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        )
      ],
      currentIndex: _selectedIndex,
      backgroundColor: Colors.black38,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      onTap: _onTap,
    );
  }

  void _onTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }
}
