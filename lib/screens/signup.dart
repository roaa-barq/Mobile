import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:waste_collector/constants.dart';
import 'package:http/http.dart' as http;
import 'package:waste_collector/screens/customer.dart';
import 'package:waste_collector/screens/customerNav.dart';
import 'package:waste_collector/screens/login.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  late TextEditingController nameController;
  late TextEditingController identityController;
  late TextEditingController phoneController;
  late TextEditingController passController;
  late TextEditingController repassController;
  bool pass = true;
  bool repass = true;

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
      backgroundColor: greenDark,
      body: ListView(
        children: <Widget>[
          Center(
              child: Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Text('إنشاء حساب جديد',
                      style: TextStyle(
                        fontFamily: 'El Messiri',
                        fontSize: 35,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        //
                      )))),
          Stack(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.4,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                  )),
              Positioned(
                top: -250,
                right: -150,
                child: Image.asset(
                  'assets/photos/border.png',
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(30, 150, 30, 0),
                  child: Row(children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: TextField(
                          controller: nameController,
                          cursorColor: Colors.black,
                          textAlign: TextAlign.right,
                          decoration: ThemeHelper().textInputDecoration(
                              Icons.perm_identity,
                              "الإسم",
                              "أدخل الإسم الرباعي الخاص بك ..")),
                    ),
                  ])),
              Padding(
                  padding: const EdgeInsets.fromLTRB(30, 210, 30, 0),
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
              Padding(
                  padding: const EdgeInsets.fromLTRB(30, 270, 30, 0),
                  child: Row(children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: TextField(
                          controller: phoneController,
                          cursorColor: Colors.black,
                          textAlign: TextAlign.right,
                          decoration: ThemeHelper().textInputDecoration(
                              Icons.phone_android,
                              "رقم الهاتف",
                              "أدخل رقم الهاتف الخاص بك ..")),
                    )
                  ])),
              Padding(
                  padding: const EdgeInsets.fromLTRB(30, 330, 30, 0),
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
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 10, 20, 10),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.black)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.black)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 2.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 2.0)))),
                    )
                  ])),
              Padding(
                  padding: const EdgeInsets.fromLTRB(30, 390, 30, 0),
                  child: Row(children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: TextField(
                          controller: repassController,
                          cursorColor: Colors.black,
                          obscureText: repass,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                              labelText: 'تأكيد كلمة المرور',
                              hintText: 'أعد كتابة كلمة المرور الخاصة بك ..',
                              suffixIcon: InkWell(
                                onTap: _retogglePass,
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
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 10, 20, 10),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.black)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.black)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 2.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 2.0)))),
                    )
                  ])),
              Padding(
                  padding: const EdgeInsets.fromLTRB(55, 460, 55, 0),
                  child: Row(children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.4,
                      child: FlatButton(
                          onPressed: () {
                            signUp();
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
                                  'إنشاء حساب',
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
                  padding: const EdgeInsets.fromLTRB(45, 520, 45, 0),
                  child: Row(children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => login()),
                            );
                          },
                          child: Text(
                            'هل تمتلك حساب ؟ تسجيل الدخول',
                            style: TextStyle(
                              fontFamily: 'El Messiri',
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          )),
                    )
                  ])),
            ],
          ),
        ],
      ),
    );
  }

  void _togglePass() {
    setState(() {
      pass = !pass;
    });
  }

  void _retogglePass() {
    setState(() {
      repass = !repass;
    });
  }

  Future<void> signUp() async {
    if (nameController.text.isEmpty ||
        identityController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passController.text.isEmpty ||
        repassController.text.isEmpty) {
      print("empty fields");
      return;
    }
    if (passController.text != repassController.text) {
      print("no match");
      return;
    }
    var body = jsonEncode({
      "name": nameController.text,
      "Identity": identityController.text,
      "phone": phoneController.text,
      "password": passController.text,
    });
    var res = await http.post(Uri.parse(baseUrl + "/users"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);
    if (res.statusCode == 201) {
      print("done");
      clear();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => customerNav()),
      );
    } else
      print("failed");
  }

  void clear() {
    nameController.text = "";
    phoneController.text = "";
    identityController.text = "";
    passController.text = "";
    repassController.text = "";
  }
}
