import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:waste_collector/constants.dart';
import 'package:waste_collector/main.dart';
import 'package:waste_collector/screens/customer.dart';
import 'package:waste_collector/screens/gpsCustomer.dart';
import 'package:waste_collector/screens/login.dart';
import 'package:waste_collector/screens/profileCustomer.dart';
import 'package:http/http.dart' as http;
import 'package:waste_collector/models/fetchData.dart';

class customerNav extends StatefulWidget {
  const customerNav({Key? key}) : super(key: key);
  final String title = "";

  @override
  _customerNavState createState() => _customerNavState();
}

class _customerNavState extends State<customerNav> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int selectedPos = 0;

  var PageAll = [customer(), gpsCustomer(), profileCustomer(), login()];

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
      case 3:
        slogan = 3;
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
            (slogan == 1) ? Icons.map_outlined : Icons.map_outlined,
            color: Colors.white,
          ),
          Icon(
            (slogan == 2) ? Icons.person : Icons.person,
            color: Colors.white,
          ),
          Icon(
            (slogan == 3) ? Icons.logout : Icons.logout,
            color: Colors.white,
          ),
        ],
        animationDuration: Duration(milliseconds: 300),
        onTap: (int selectedPos) {
          setState(() {
            if (selectedPos == 3) {
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

    var res = await http.post(Uri.parse(baseUrl + "/users/logoutAll"),
        headers: header);
    if (res.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => login()),
      );
    }
  }
}
