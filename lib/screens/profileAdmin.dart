import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:waste_collector/models/adminModel.dart';

import '../constants.dart';
import '../main.dart';
import '../models/fetchData.dart';

class profileAdmin extends StatefulWidget {
  const profileAdmin({Key? key}) : super(key: key);

  @override
  State<profileAdmin> createState() => _profileAdminState();
}

class _profileAdminState extends State<profileAdmin> {
  bool pass = true;
  bool edit = true;
  bool save = false;
  late TextEditingController nameController;
  late TextEditingController identityController;
  late TextEditingController phoneController;
  late TextEditingController passController;
  late TextEditingController repassController;
  fetchData _fetchData = fetchData();

  @override
  void initState() {
    super.initState();
    _fetchData.fetchMyAccount();
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
      body: SingleChildScrollView(
        child: Stack(children: [
          myData(),
          Padding(
            padding: const EdgeInsets.fromLTRB(80, 60, 80, 0),
            child: Text('الصفحة الشخصية',
                style: TextStyle(
                  fontFamily: 'El Messiri',
                  fontSize: 30,
                  color: Colors.black,
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Image(
              image: AssetImage("assets/photos/add.png"),
              height: 400,
              width: 400,
            ),
          ),
          Visibility(
            visible: save,
            child: Stack(children: [
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
                  padding: const EdgeInsets.fromLTRB(55, 610, 55, 0),
                  child: Row(children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.4,
                      child: FlatButton(
                          onPressed: () {
                            setState(() {});
                            update();
                            clear();
                            _toggleSave();
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
                                  'حفظ المعلومات',
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
        ]),
      ),
    );
  }

  Widget myData() {
    return FutureBuilder(
      future: _fetchData.fetchMyAccountAdmin(),
      builder: (context, snapchot) {
        adminModel data = snapchot.data as adminModel;
        return snapchot.data == null
            ? Text("جاري التحميل...")
            : Stack(
                children: [
                  Visibility(
                    visible: save,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 490, 30, 0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            )),
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 50,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.fact_check,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('رقم الهوية: ' + data.Identity,
                                style: TextStyle(
                                  fontFamily: 'El Messiri',
                                  fontSize: 20,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                  //
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                      visible: edit,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 390, 30, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  )),
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 50,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.perm_identity,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('الإسم: ' + data.name,
                                      style: TextStyle(
                                        fontFamily: 'El Messiri',
                                        fontSize: 20,
                                        color: Colors.black,
                                        decoration: TextDecoration.none,
                                        //
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 450, 30, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  )),
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 50,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.phone_android,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('رقم الهاتف: ' + data.phone,
                                      style: TextStyle(
                                        fontFamily: 'El Messiri',
                                        fontSize: 20,
                                        color: Colors.black,
                                        decoration: TextDecoration.none,
                                        //
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 510, 30, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  )),
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 50,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.fact_check,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('رقم الهوية: ' + data.Identity,
                                      style: TextStyle(
                                        fontFamily: 'El Messiri',
                                        fontSize: 20,
                                        color: Colors.black,
                                        decoration: TextDecoration.none,
                                        //
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(55, 570, 55, 0),
                              child: Row(children: <Widget>[
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  child: FlatButton(
                                      onPressed: () {
                                        _toggleEdit();
                                      },
                                      textColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30))),
                                          child: Center(
                                            child: Text(
                                              'تعديل المعلومات',
                                              style: TextStyle(
                                                fontFamily: 'El Messiri',
                                                fontSize: 22,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ))),
                                )
                              ]))
                        ],
                      ))
                ],
              );
      },
    );
  }

  Future<void> update() async {
    if (nameController.text.isNotEmpty) {
      var body1 = jsonEncode({"name": nameController.text});
      var res = await http.patch(
        Uri.parse(baseUrl + "/admins/me"),
        headers: {
          "Authorization": "Bearer " + prefs.get("token").toString(),
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: body1,
      );
      print(res.statusCode);
    }
    if (phoneController.text.isNotEmpty) {
      var body1 = jsonEncode({"phone": phoneController.text});
      var res = await http.patch(
        Uri.parse(baseUrl + "/admins/me"),
        headers: {
          "Authorization": "Bearer " + prefs.get("token").toString(),
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: body1,
      );
      print(res.body);
    }
    if (passController.text.isNotEmpty) {
      var body1 = jsonEncode({"password": passController.text});
      var res = await http.patch(
        Uri.parse(baseUrl + "/admins/me"),
        headers: {
          "Authorization": "Bearer " + prefs.get("token").toString(),
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: body1,
      );
      print(res.body);
    } else
      print("faild");
  }

  void _togglePass() {
    setState(() {
      pass = !pass;
    });
  }

  void _toggleEdit() {
    setState(() {
      edit = false;
      save = true;
    });
  }

  void _toggleSave() {
    setState(() {
      save = false;
      edit = true;
    });
  }

  void clear() {
    nameController.text = "";
    phoneController.text = "";
    passController.text = "";
  }
}
