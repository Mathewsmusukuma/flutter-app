import 'package:shared_preferences/shared_preferences.dart';
import '../service/http_data_service.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Future <List<Data>> futureData;
  String _token = "";

  @override
  void initState() {
    super.initState();
    _loadUserInfo();

    futureData = fetchData('eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjUzMTczNzkzLCJpYXQiOjE2NTMxNzAxOTMsImp0aSI6IjIzMGNkM2EzZDhjMjRhODRiNjU1NTJlY2Q0ZmMxMTk5IiwidXNlcl9pZCI6MX0.SprQRwKT3hlBj35HC-v4zsnwjnxdUkZRT3e20fVMhw8');
  }

  _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = (prefs.getString('_token') ?? "");
    if (_token == "") {
      await Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }else{

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Dashboard"),
      ),

        body: Center(
          child: FutureBuilder <List<Data>>(
            future: futureData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<Data>? data = snapshot.data;

                return
                  ListView.builder(
                      itemCount: data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        var name = snapshot.data?[index].username;
                        return Card(
                                  child: ListTile(
                                    title:Text(name) ,
                                  )
                          );
                      }
                  );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
    );
  }
}
