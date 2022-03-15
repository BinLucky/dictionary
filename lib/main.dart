import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainScf());
  }
}

class MainScf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Dictionary"),
          IconButton(
              onPressed: () {
                SearchForm(context);
              },
              icon: const Icon(Icons.search))
        ]),
      ),
      body: MainBody(),
    );
  }
}

void SearchForm(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                Positioned(
                    left: -5.0,
                    child: InkResponse(
                      onTap: () => Navigator.of(context).pop(),
                      child: CircleAvatar(
                        radius: 12,
                        child: Icon(Icons.close, size: 18),
                        backgroundColor: Colors.red,
                      ),
                    )),
                Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.amber.shade300,
                            shape: BoxShape.rectangle),
                        child: Text("Enter"),
                      ),
                      TextFormField()
                    ],
                    mainAxisSize: MainAxisSize.min,
                  ),
                )
              ],
            ));
      });
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
