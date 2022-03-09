part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchSubmitedEvent extends SearchEvent {
  SearchSubmitedEvent({required this.word});
  final String word;
}

class SubmitFailedEvent extends SearchEvent {}

class RespondedEvent extends SearchEvent {}
