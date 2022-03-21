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
      /* Word respondWord = await repo.get(event.word);
      debugPrint("Word Returned");
      if (respondWord
          .meanings!.first.definitions!.first.definition!.isNotEmpty) {
        emit(SearchSuccessState());
      } else {
        emit(SearchFailedState());
      }*/
    });
  }
}
