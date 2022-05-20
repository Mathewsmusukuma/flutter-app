import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
