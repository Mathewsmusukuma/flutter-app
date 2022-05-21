import 'package:http/http.dart' as http;
import 'dart:convert';

Future <List<Data>> fetchData(String token) async {
  final dataUrl = Uri.parse('http://10.0.2.2:8000/users/list/');

  final response = await http.get(
      dataUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
  print(token);

  print( json.decode(response.body));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occurred!');
  }
}

class Data {
  final String username ;

  Data({required this.username});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      username: json['username'],
    );
  }
}
