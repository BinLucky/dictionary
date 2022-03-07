import 'package:http/http.dart' as http;
import 'package:dictionary_repository/dictionary_repository.dart';

class DictionaryApi {
  static const String sourceURL =
      "https://api.dictionaryapi.dev/api/v2/entries/en/";
  final http.Client httpClient = http.Client();

  Future<Word> getWord(String word) async {


    
  }
}
