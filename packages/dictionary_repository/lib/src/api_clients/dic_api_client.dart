import 'package:http/http.dart' as http;
import 'package:dictionary_repository/dictionary_repository.dart';
import 'dart:convert';

class DictionaryApi {
  static const sourceURL = "https://api.dictionaryapi.dev/api/v2/entries/en/";
  final http.Client httpClient = http.Client();
  //late List<Word> wordList;

  Future<Word> getWord(String word) async {
    final searchURL = sourceURL + word;
    final response = await httpClient.get(Uri.parse(searchURL));
    if (response.statusCode != 200) {
      throw Exception("No Response from server");
    }
    final responseJson = jsonDecode(response.body) as List;
    if (responseJson[0] == null) {
      throw Exception("No meanings");
    }
    return Word.fromJson(responseJson[0]);
  }
}
