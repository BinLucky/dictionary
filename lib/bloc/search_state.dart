part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchInProgressState extends SearchState {}

class SearchFailedState extends SearchState {}

class SearchSuccessState extends SearchState {}
