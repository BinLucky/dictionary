import 'package:currency_tracker/bloc/search_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'defination_list.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is SearchInProgressState) {
          Navigator.of(context).pop();
          return Container(
            child: const CircularProgressIndicator(),
            alignment: Alignment.center,
          );
        } else if (state is SearchSuccessState) {
          return DefinationList(definitationWord: state.searchedWord);
        } else if (state is SearchFailedState) {
          return Center(
            child: Column(
              children: const [
                Icon(Icons.error_outline_rounded),
                Text("An Error Accurated")
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
