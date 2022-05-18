import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:waste_collector/constants.dart';
import 'package:flutter/src/painting/box_border.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:waste_collector/models/fetchData.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../main.dart';
import '../models/officerModel.dart';

class officer extends StatefulWidget {
  const officer({Key? key}) : super(key: key);

  static const String _title = 'قائمة الموظفين';

  @override
  State<officer> createState() => _officerState();
}

class _officerState extends State<officer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        //  AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale("ar", "AE")],
      locale: Locale("ar", "AE"),
      title: officer._title,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            officer._title,
            style: TextStyle(
              fontFamily: 'El Messiri',
              fontSize: 30,
              color: Colors.white,
            ),
          )),
          // backgroundColor: greenDark,
          flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              greenLight,
              greenDark,
            ],
          ))),
          toolbarHeight: 60,
        ),
        body: const Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  fetchData _fetchData = fetchData();
  late TextEditingController nameController;
  late TextEditingController identityController;
  late TextEditingController phoneController;
  late TextEditingController passController;
  @override
  void initState() {
    nameController = TextEditingController();
    identityController = TextEditingController();
    phoneController = TextEditingController();
    passController = TextEditingController();
    _fetchData.fetchAllOfficers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 20,
          ),
          fetchAllOfficers(),
        ],
      )),
    );
  }

  Widget officerCard(String name, String id, String Identity, String phone) {
    return Padding(
        padding: EdgeInsets.all(6),
        child: FlatButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => DraggableScrollableSheet(
                initialChildSize: 0.64,
                minChildSize: 0.2,
                maxChildSize: 1,
                builder: (context, scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                        color: greenDark,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                          height: MediaQuery.of(context).size.height / 1.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Stack(
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        25, 40, 25, 0),
                                    child: Text('معلومات الموظف الشخصية',
                                        style: TextStyle(
                                          fontFamily: 'El Messiri',
                                          fontSize: 25,
                                          color: Colors.black,
                                          decoration: TextDecoration.none,
                                          //
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 100, 30, 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1,
                                          )),
                                      width: MediaQuery.of(context).size.width /
                                          1.35,
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
                                          Text('الإسم: ' + name,
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
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 160, 30, 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1,
                                          )),
                                      width: MediaQuery.of(context).size.width /
                                          1.35,
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
                                          Text('رقم الهاتف: ' + phone,
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
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 220, 30, 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1,
                                          )),
                                      width: MediaQuery.of(context).size.width /
                                          1.35,
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
                                          Text('رقم الهوية: ' + Identity,
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
                                    padding: const EdgeInsets.fromLTRB(
                                        55, 300, 55, 0),
                                    child: Row(children: <Widget>[
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.7,
                                        child: FlatButton(
                                            onPressed: () {
                                              setState(() {});
                                              Delete(id);
                                            },
                                            textColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      begin:
                                                          Alignment.centerRight,
                                                      end: Alignment.centerLeft,
                                                      colors: [
                                                        greenLight,
                                                        greenDark,
                                                      ],
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15))),
                                                child: Center(
                                                  child: Text(
                                                    'حذف الموظف',
                                                    style: TextStyle(
                                                      fontFamily: 'El Messiri',
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ))),
                                      ),
                                    ]),
                                  )
                                ],
                              ),
                            ],
                          )),
                    ),
                  );
                },
              ),
            );
          },
          child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: greenDark, width: 2)),
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(
                    fontFamily: 'El Messiri',
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
              )),
        ));
  }

  Widget fetchAllOfficers() {
    return FutureBuilder(
        future: _fetchData.fetchAllOfficers(),
        builder: (context, snapchot) {
          var officers = snapchot.data as List<officerModel>;
          return snapchot.data == null
              ? Text("جاري التحميل")
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: officers == null ? 0 : officers.length,
                  itemBuilder: (context, index) {
                    return officerCard(officers[index].name, officers[index].id,
                        officers[index].Identity, officers[index].phone);
                  });
        });
  }

  Future<void> Delete(id) async {
    var officerID = baseUrl + "/officers/" + id.toString();
    var res = await http.delete(
      Uri.parse(officerID),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print(res.statusCode);
  }
}
