import 'package:currency_tracker/bloc/search_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dictionary_repository/dictionary_repository.dart';

class DefinationList extends StatelessWidget {
  DefinationList(
      {required this.listLength,
      required this.blockState,
      required this.mainTitle,
      required this.definations});
  final int listLength;
  final SearchState blockState;
  final String mainTitle;
  final List definations;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(mainTitle),
          backgroundColor: Colors.deepOrangeAccent.shade700,
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, i) {
          return Card(
            margin: EdgeInsets.all(3),
            elevation: 10.0,
            child: ListTile(
              title: Text(definations[i].toString()),
            ),
          );
        }, childCount: listLength))
      ],
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is SearchInProgressState) {
          Navigator.of(context).pop();
          return Container(
            child: CircularProgressIndicator(),
            alignment: Alignment.center,
          );
        } else if (state is SearchSuccessState) {
          int wordLegn = state.searchedWord.meanings!.length;
          String mainTitle = state.searchedWord.IncomingWord.toString();
          List<Definition>? definations =
              state.searchedWord.meanings![1].definitions;
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(state.searchedWord.IncomingWord.toString()),
                backgroundColor: Colors.deepOrangeAccent.shade700,
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, i) {
                return Card(
                  margin: EdgeInsets.all(3),
                  elevation: 10.0,
                  child: ListTile(
                    title: Text(state
                        .searchedWord.meanings![1].definitions![i].definition
                        .toString()),
                  ),
                );
              }, childCount: wordLegn))
            ],
          );

          /*return SingleChildScrollView(
            child: Container(
              color: Colors.red,
              alignment: Alignment.center,
              child: Card(
                child: Column(children: [
                  Card(
                    child: Text(
                      state.searchedWord.IncomingWord!.toString(),
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  ListView.builder(
                      itemCount: wordLegn,
                      itemBuilder: (context, i) {
                        return Card(
                          child:
                              Text(state.searchedWord.meanings![i].toString()),
                        );
                      })
                ]),
              ),
            ),
          );*/
        }
        return Container();
      },
    );
  }
}


/*SingleChildScrollView(
              child: Container(
            padding: EdgeInsets.all(15),
            child: ListView.builder(
                itemCount: wordLegn,
                itemBuilder: (context, i) {
                  return Card(
                    margin: EdgeInsets.all(3),
                    elevation: 10.0,
                    child: ListTile(
                      title: Text(state
                          .searchedWord.meanings![1].definitions![i].definition
                          .toString()),
                    ),
                  );
                }),
          ));*/
