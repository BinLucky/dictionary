import 'package:dictionary_repository/dictionary_repository.dart';
import 'package:flutter/material.dart';

class DefinationList extends StatelessWidget {
  const DefinationList({required this.definitationWord});
  final Word definitationWord;
  @override
  Widget build(BuildContext context) {
    int listLength = definitationWord.meanings![0].definitions!.length;
    String mainTitle = definitationWord.IncomingWord!;
    List<Definition> definations = definitationWord.meanings![0].definitions!;
    // TODO: implement build
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(mainTitle),
          centerTitle: false,
          backgroundColor: Colors.indigo.shade700,
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, i) {
          return Card(
            margin: EdgeInsets.all(3),
            elevation: 10.0,
            child: ListTile(
              title: Text(definations[i].definition.toString()),
            ),
          );
        }, childCount: listLength))
      ],
    );
  }
}
