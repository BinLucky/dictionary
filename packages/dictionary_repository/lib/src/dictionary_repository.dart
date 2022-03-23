import 'models/models.dart';
import 'api_clients/dic_api_client.dart';

class DictionaryRepository {
  Future<Word> get(String word) async {
    DictionaryApi dicApi = DictionaryApi();
    Word resultWord = await dicApi.getWord(word);
    return resultWord;
  }
}
