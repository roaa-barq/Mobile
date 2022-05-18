import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:waste_collector/constants.dart';
import 'package:waste_collector/screens/adminNav.dart';
import 'package:waste_collector/screens/gpsAdmin.dart';

class add extends StatefulWidget {
  const add({Key? key}) : super(key: key);

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  late TextEditingController nameController;
  late TextEditingController identityController;
  late TextEditingController phoneController;
  late TextEditingController passController;
  bool pass = true;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    identityController = TextEditingController();
    phoneController = TextEditingController();
    passController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 70, 40, 0),
            child: Image(
              image: AssetImage("assets/photos/add.png"),
              height: 300,
              width: 300,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(70, 50, 70, 0),
            child: Text('إضافة موظف جديد',
                style: TextStyle(
                  fontFamily: 'El Messiri',
                  fontSize: 30,
                  color: Colors.black,
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 320, 0),
            child: FlatButton(
                height: 40,
                minWidth: 40,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => adminNav()),
                  );
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: greenDark,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    Icons.home_filled,
                    color: Colors.white,
                    size: 30,
                  ),
                )),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(30, 370, 30, 0),
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
              padding: const EdgeInsets.fromLTRB(30, 430, 30, 0),
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
              padding: const EdgeInsets.fromLTRB(30, 490, 30, 0),
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
              padding: const EdgeInsets.fromLTRB(30, 550, 30, 0),
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
                          hintText: 'أدخل كلمة المرور الخاصة بالموظف ..',
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
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2.0)))),
                )
              ])),
          Padding(
              padding: const EdgeInsets.fromLTRB(55, 610, 55, 0),
              child: Row(children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.4,
                  child: FlatButton(
                      onPressed: () {
                        _addofficer();
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
                              'إضافة موظف',
                              style: TextStyle(
                                fontFamily: 'El Messiri',
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                          ))),
                )
              ])),
        ]),
      ),
    );
  }

  void _togglePass() {
    setState(() {
      pass = !pass;
    });
  }

  Future<void> _addofficer() async {
    if (nameController.text.isEmpty ||
        identityController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passController.text.isEmpty) {
      print("empty fields");
      return;
    }

    var body = jsonEncode({
      "name": nameController.text,
      "Identity": identityController.text,
      "phone": phoneController.text,
      "password": passController.text,
    });
    var res = await http.post(Uri.parse(baseUrl + "/officers"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);
    if (res.statusCode == 201) {
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
    nameController.text = "";
    phoneController.text = "";
    identityController.text = "";
    passController.text = "";
  }
}
