// ignore_for_file: file_names, camel_case_types, library_prefixes, unused_element, must_be_immutable, unnecessary_new, prefer_const_constructors, import_of_legacy_library_into_null_safe, use_key_in_widget_constructors, avoid_unnecessary_containers, avoid_print, unused_import, prefer_const_declarations, unused_local_variable, deprecated_member_use, prefer_final_fields, unnecessary_this, curly_braces_in_flow_control_structures

import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:waste_collector/constants.dart';

import '../models/fetchData.dart';
import '../models/mapModel.dart';

class addBasket extends StatefulWidget {
  const addBasket({Key? key}) : super(key: key);
  @override
  _addBasket createState() => _addBasket();
}

class _addBasket extends State<addBasket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyMap(),
    );
  }
}

class MyMap extends StatefulWidget {
  @override
  _MyMap createState() => new _MyMap();
}

class _MyMap extends State<MyMap> {
  bool isChecked = false;
  fetchData _fetchData = fetchData();
  TextEditingController _lat = TextEditingController();
  TextEditingController _long = TextEditingController();
  TextEditingController _size = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchAllPoints();
  }

  @override
  List<mapModel> _points = [];

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            backgroundColor: greenDark,
            title: new Text('اضافة حاوية'),
            leading: new IconButton(
              icon: Icon(Icons.add),
              onPressed: () async {
                addMarker();
              },
            )),
        body: FlutterMap(
          options: new MapOptions(
            center: new LatLng(32.219353, 35.243198),
            minZoom: 10.0,
            zoom: 14,
          ),
          layers: [
            new TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            MarkerLayerOptions(
              markers: _points
                  .map((e) => Marker(
                        width: 45.0,
                        height: 45.0,
                        point:
                            LatLng(double.parse(e.lat), double.parse(e.long)),
                        builder: (context) => Container(
                          child: IconButton(
                              icon: Icon(Icons.location_pin),
                              onPressed: () {
                                print('Marker tapped!');
                              }),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ));
  }

  void fetchAllPoints() async {
    var data = await _fetchData.fetchAllmap();
    setState(() {
      this._points = data;
    });
  }

  Future addMarker() async {
    await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text(
              'اضافة حاوية جديدة',
              style: TextStyle(
                fontFamily: 'El Messiri',
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            actions: <Widget>[
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.4,
                      child: TextField(
                          controller: _lat,
                          cursorColor: Colors.black,
                          textAlign: TextAlign.right,
                          decoration: ThemeHelper2().textInputDecoration(
                              "الاحداثي السيني",
                              "أدخل الاحداثي السيني الخاص بموقع الحاوية ..")),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.4,
                      child: TextField(
                          controller: _long,
                          cursorColor: Colors.black,
                          textAlign: TextAlign.right,
                          decoration: ThemeHelper2().textInputDecoration(
                              "الاحداثي الصادي",
                              "أدخل الاحداثي الصادي الخاص بموقع الحاوية ..")),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.4,
                      child: TextField(
                          controller: _size,
                          cursorColor: Colors.black,
                          textAlign: TextAlign.right,
                          decoration: ThemeHelper2().textInputDecoration(
                              "سعة الحاوية", "أدخل سعة الحاوية ..")),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.6,
                      child: FlatButton(
                          onPressed: () {
                            _addBasket();
                            setState(() {});
                          },
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
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
                                  'إضافة',
                                  style: TextStyle(
                                    fontFamily: 'El Messiri',
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ))),
                    )
                  ],
                ),
              )
            ],
          );
        });
  }

  Future<void> _addBasket() async {
    if (_lat.text.isEmpty || _long.text.isEmpty || _size.text.isEmpty) {
      print("empty fields");
      return;
    }

    var body = jsonEncode({
      "lat": _lat.text,
      "long": _long.text,
      "sizePoint": _size.text,
    });
    var res = await http.post(Uri.parse(baseUrl + "/maps"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);
  }

  void clear() {
    _lat.text = "";
    _long.text = "";
    _size.text = "";
  }
}
