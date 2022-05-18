import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:waste_collector/constants.dart';
import 'package:waste_collector/main.dart';
import 'package:waste_collector/screens/addOfficer.dart';
import 'package:waste_collector/screens/admin.dart';
import 'package:waste_collector/screens/login.dart';
import 'package:waste_collector/screens/officer.dart';
import 'package:waste_collector/screens/officersTable.dart';
import 'package:waste_collector/screens/profileCustomer.dart';
import 'package:http/http.dart' as http;
import 'package:waste_collector/screens/profileOfficer.dart';

class officerNav extends StatefulWidget {
  const officerNav({Key? key}) : super(key: key);
  final String title = "";

  @override
  _officerNavState createState() => _officerNavState();
}

class _officerNavState extends State<officerNav> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int selectedPos = 0;

  var PageAll = [officerWelcome(), profileOfficer(), login()];

  var slogan = 0;

  double bottomNavBarHeight = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            child: bodyContainer(),
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  Widget bodyContainer() {
    switch (selectedPos) {
      case 0:
        slogan = 0;
        break;
      case 1:
        slogan = 1;
        break;
      case 2:
        slogan = 2;
        break;
    }

    return GestureDetector(
      child: Scaffold(
        body: PageAll[slogan],
      ),
      onTap: () {},
    );
  }

  Widget bottomNav() {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: greenDark,
        backgroundColor: Colors.white,
        height: 50,
        key: _bottomNavigationKey,
        items: <Widget>[
          Icon(
            (slogan == 0) ? Icons.home : Icons.home,
            color: Colors.white,
          ),
          Icon(
            (slogan == 1) ? Icons.person : Icons.person,
            color: Colors.white,
          ),
          Icon(
            (slogan == 2) ? Icons.logout : Icons.logout,
            color: Colors.white,
          ),
        ],
        animationDuration: Duration(milliseconds: 300),
        onTap: (int selectedPos) {
          setState(() {
            if (selectedPos == 2) {
              LogoutAll();
            } else
              this.selectedPos = selectedPos;
          });
        },
      ),
      body: PageAll[slogan],
    );
  }

  Future<void> LogoutAll() async {
    var header = {"Authorization": "Bearer " + prefs.get("token").toString()};

    var res = await http.post(Uri.parse(baseUrl + "/officers/logoutAll"),
        headers: header);
    if (res.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => login()),
      );
    }
  }
}
