// ignore_for_file: file_names, camel_case_types, library_prefixes, unused_element, must_be_immutable, unnecessary_new, prefer_const_constructors, import_of_legacy_library_into_null_safe, use_key_in_widget_constructors, avoid_unnecessary_containers, avoid_print, unused_import, prefer_const_declarations, unused_local_variable, deprecated_member_use, prefer_final_fields, unnecessary_this, curly_braces_in_flow_control_structures

import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:waste_collector/constants.dart';
import 'package:waste_collector/screens/customerNav.dart';

import '../models/fetchData.dart';
import '../models/mapModel.dart';
import 'adminNav.dart';

class gpsCustomer extends StatefulWidget {
  const gpsCustomer({Key? key}) : super(key: key);
  @override
  _gpsCustomer createState() => _gpsCustomer();
}

class _gpsCustomer extends State<gpsCustomer> {
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
            title: new Text('تتبع خط سير الشاحنات'),
            leading: new IconButton(
              icon: Icon(Icons.home_filled),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => customerNav()),
                );
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
}
