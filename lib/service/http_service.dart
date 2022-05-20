import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../views/dashboard_screen.dart';

class HttpService {
  static final _client = http.Client();

  static final _loginUrl = Uri.parse('http://10.0.2.2:8000/login/');

  static login(email, password, context) async {
    http.Response response = await _client.post(_loginUrl, body: {
      "username": email,
      "password": password,
    });
    if (response.statusCode == 202) {
      var json = jsonDecode(response.body);
      if (json['status'] == 'success') {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("_token", "token");
        await EasyLoading.showSuccess(
            json['message']);
        await Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const DashboardScreen()));
      } else {
        EasyLoading.showError('Oops! an error occurred');
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }
}
