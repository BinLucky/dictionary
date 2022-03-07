import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(children: const [Text("Dictionary")]),
        ),
        body: MainBody(),
      ),
    );
  }
}

class MainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const TextField(
            autofocus: true,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.workspaces_filled),
                fillColor: Colors.deepPurpleAccent,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(34)))),
          ),
          const SizedBox(height: 8),
          CupertinoButton.filled(child: const Text("Search"), onPressed: () {})
        ],
      ),
    );
  }
}
