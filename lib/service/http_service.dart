import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../views/dashboard.dart';

class HttpService {
  static final _client = http.Client();

  static final _loginUrl = Uri.parse('http://localhost:8000/login/');

  static login(email, password, context) async {
    http.Response response = await _client.post(_loginUrl, body: {
      "username": email,
      "password": password,
    });

    print(response);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      if (json[0] == 'success') {
        await EasyLoading.showSuccess(json[0]);
        await Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Dashboard()));
      } else {
        EasyLoading.showError(json[0]);
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }
}
