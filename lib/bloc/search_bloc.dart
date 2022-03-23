import 'package:bloc/bloc.dart';
import 'package:dictionary_repository/dictionary_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  DictionaryRepository repo = DictionaryRepository();

  SearchBloc() : super(SearchInitial()) {
    on<SearchSubmitedEvent>((event, emit) async {
      debugPrint("Search Submited");
      emit(SearchInProgressState());
      await repo
          .get(event.word)
          .then((value) => emit(SearchSuccessState(searchedWord: value)));
    });
  }
}
