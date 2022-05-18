import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:waste_collector/constants.dart';
import 'package:http/http.dart' as http;
import 'package:waste_collector/screens/adminNav.dart';
import 'package:waste_collector/screens/customer.dart';
import 'package:waste_collector/screens/customerNav.dart';
import 'package:waste_collector/screens/officerNav.dart';
import 'package:waste_collector/screens/sharedPrefs.dart';
import 'package:waste_collector/screens/signup.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  late TextEditingController nameController;
  late TextEditingController identityController;
  late TextEditingController phoneController;
  late TextEditingController passController;
  late TextEditingController repassController;
  bool pass = true;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    identityController = TextEditingController();
    phoneController = TextEditingController();
    passController = TextEditingController();
    repassController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(color: Colors.white),
                ),
                Positioned(
                  top: -180,
                  left: -200,
                  child: Image.asset(
                    'assets/photos/circleBig.png',
                    height: MediaQuery.of(context).size.height * 0.8,
                  ),
                ),
                Positioned(
                  top: -50,
                  left: 10,
                  child: Image.asset(
                    'assets/photos/border.png',
                    height: MediaQuery.of(context).size.height * 0.5,
                  ),
                ),
                Positioned(
                  top: -30,
                  left: -30,
                  child: Image.asset(
                    'assets/photos/circlemed.png',
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                ),
                Positioned(
                  top: 200,
                  left: 5,
                  child: Image.asset(
                    'assets/photos/circleSmall.png',
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 250,
                  child: Image.asset(
                    'assets/photos/circleSmaller.png',
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                ),
                Positioned(
                    top: 120,
                    left: 50,
                    child: Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        fontFamily: 'El Messiri',
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TextField(
                        controller: identityController,
                        cursorColor: Colors.black,
                        textAlign: TextAlign.right,
                        decoration: ThemeHelper().textInputDecoration(
                            Icons.perm_identity,
                            "رقم الهوية",
                            "أدخل رقم الهوية الخاص بك ..")),
                  )
                ])),
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TextField(
                        controller: passController,
                        cursorColor: Colors.black,
                        obscureText: pass,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                            labelText: 'كلمة المرور',
                            hintText: 'أدخل كلمة المرور الخاصة بك ..',
                            suffixIcon: InkWell(
                              onTap: _togglePass,
                              child: Icon(
                                Icons.remove_red_eye,
                                color: Colors.black,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            labelStyle: TextStyle(
                              fontFamily: 'El Messiri',
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2.0)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.red, width: 2.0)))),
                  )
                ])),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Row(children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.4,
                        child: FlatButton(
                            onPressed: () {},
                            child: Text(
                              'هل نسيت كلمة المرور ؟',
                              style: TextStyle(
                                fontFamily: 'El Messiri',
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            )),
                      )
                    ]))),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 65),
                child: Row(children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: FlatButton(
                        onPressed: () {
                          loginFunc();
                        },
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                  colors: [
                                    greenLight,
                                    greenDark,
                                  ],
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Center(
                              child: Text(
                                'تسجيل الدخول',
                                style: TextStyle(
                                  fontFamily: 'El Messiri',
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                            ))),
                  )
                ])),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55),
                child: Row(children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => signup()),
                          );
                        },
                        child: Text(
                          'لا تمتلك حساب ؟ إنشاء حساب جديد',
                          style: TextStyle(
                            fontFamily: 'El Messiri',
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        )),
                  )
                ]))
          ],
        ));
  }

  void _togglePass() {
    setState(() {
      pass = !pass;
    });
  }

  Future<void> loginFunc() async {
    int flag = 0;
    if (identityController.text.isEmpty || passController.text.isEmpty) {
      print("empty fields");
      return;
    }
    var body = jsonEncode({
      "Identity": identityController.text,
      "password": passController.text,
    });
    var res = await http.post(Uri.parse(baseUrl + "/users/login"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);

    var res2 = await http.post(Uri.parse(baseUrl + "/officers/login"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);

    var res3 = await http.post(Uri.parse(baseUrl + "/admins/login"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      sharedPrefs.saveToken(body['token']);
      print("done");
      clear();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => customerNav()),
      );
    } else if (res2.statusCode == 200) {
      var body = jsonDecode(res2.body);
      sharedPrefs.saveToken(body['token']);
      print("done");
      clear();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => officerNav()),
      );
    } else if (res3.statusCode == 200) {
      var body = jsonDecode(res3.body);
      sharedPrefs.saveToken(body['token']);
      print("done");
      clear();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => adminNav()),
      );
    } else
      print("failed");
  }

  void clear() {
    identityController.text = "";
    passController.text = "";
  }
}
