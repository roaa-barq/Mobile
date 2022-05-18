import 'dart:convert';
import 'package:waste_collector/models/userModel.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../main.dart';
import 'adminModel.dart';
import 'mapModel.dart';
import 'officerModel.dart';

class fetchData {
  var header = {"Authorization": "Bearer " + prefs.get("token").toString()};

  Future<userModel> fetchMyAccount() async {
    var res = await http.get(Uri.parse(baseUrl + "/users/me"), headers: header);

    var body = jsonDecode(res.body);
    userModel myAccount = userModel.fromJson(body);
    return myAccount;
  }

  Future<officerModel> fetchMyAccountOfficer() async {
    var res =
        await http.get(Uri.parse(baseUrl + "/officers/me"), headers: header);

    var body = jsonDecode(res.body);
    officerModel myAccount = officerModel.fromJson(body);
    return myAccount;
  }

  Future<adminModel> fetchMyAccountAdmin() async {
    var res =
        await http.get(Uri.parse(baseUrl + "/admins/me"), headers: header);

    var body = jsonDecode(res.body);
    adminModel myAccount = adminModel.fromJson(body);
    return myAccount;
  }

  Future<List<officerModel>> fetchAllOfficers() async {
    var res = await http.get(Uri.parse(baseUrl + "/AllOfficers"));
    var body = jsonDecode(res.body) as List<dynamic>;
    return body.map((officer) => officerModel.fromJson(officer)).toList();
  }

  Future<List<mapModel>> fetchAllmap() async {
    var res = await http.get(Uri.parse(baseUrl + "/AllMaps"));
    var body = jsonDecode(res.body) as List<dynamic>;
    return body.map((map) => mapModel.fromJson(map)).toList();
  }
}
