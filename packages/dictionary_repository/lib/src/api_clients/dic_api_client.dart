import 'package:http/http.dart' as http;
import 'package:dictionary_repository/dictionary_repository.dart';
import 'dart:convert';

class DictionaryApi {
  static const sourceURL = "https://api.dictionaryapi.dev/api/v2/entries/en/";
  final http.Client httpClient = http.Client();
  late List<Word> wordList;

  Future<List<Word>> getWord(String word) async {
    final searchURL = sourceURL + word;
    final response = await httpClient.get(Uri.parse(searchURL));
    if (response.statusCode != 200) {
      throw Exception("No Response from server");
    }
    final responseJsonList = jsonDecode(response.body);
    for (var wrd in responseJsonList) {
      wordList.add(Word.fromJson(wrd));
    }

    return wordList; //Word.fromJson(responseJson);
  }
}
