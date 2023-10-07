import 'dart:convert';
import 'package:clima_flutter/services/networking.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class FakeNetworkHelper implements NetworkHelper{
  @override
  String url = "http://192.168.0.35:3000/db";

  @override
  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    debugPrint(data.toString());
  }
}