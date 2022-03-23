import 'package:currency_tracker/bloc/search_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dictionary_repository/dictionary_repository.dart';

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
          return Container(
            padding: EdgeInsets.all(15),
            child: ListView.builder(
                itemCount: wordLegn,
                itemBuilder: (context, i) {
                  return Card(
                    child: Text(state
                        .searchedWord.meanings![1].definitions![i].definition
                        .toString()),
                  );
                }),
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