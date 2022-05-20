import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Dashboard"),
      ),
      body: ListView(
        shrinkWrap: true,
        reverse: true,
        padding: const EdgeInsets.all(10),
        itemExtent: 100,
        children: const [
          Card(
              child: ListTile(
                title:Text("Username 1") ,
              )
          ),
          Card(
            child: ListTile(
              title: Text("Username 2"),
            ),
          ),
          Card(
              child: ListTile(
                title: Text("Username 3"),
              )
          ),
        ],
      )
    );
  }
}
