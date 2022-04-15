import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_http_flutter/views/dio_view.dart';
import 'package:json_http_flutter/views/local_json_view.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("main screen")),
      body: Center(
        child: Column(children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
                minimumSize: const Size.fromHeight(40),
                primary: Colors.teal,
              ),
              onPressed: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const LocalJsonView())),
              child: const Text("Local json")),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
                minimumSize: const Size.fromHeight(40),
                primary: Colors.teal,
              ),
              onPressed: () => Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => const DioView())),
              child: const Text("Remote api with DIO")),
        ]),
      ),
    );
  }
}
