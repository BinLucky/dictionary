// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Word> welcomeFromJson(String str) => List<Word>.from(json.decode(str).map((x) => Word.fromJson(x)));

String welcomeToJson(List<Word> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Word {
    Word({
        this.IncomingWord,
        this.phonetic,
        this.phonetics,
        this.meanings,
        this.license,
        this.sourceUrls,
    });

    String? IncomingWord;
    String? phonetic;
    List<Phonetic>? phonetics;
    List<Meaning>? meanings;
    License ?license;
    List<String>? sourceUrls;

    factory Word.fromJson(Map<String, dynamic> json) => Word(
        IncomingWord: json["word"] == null ? null : json["word"],
        phonetic: json["phonetic"] == null ? null : json["phonetic"],
        phonetics: json["phonetics"] == null ? null : List<Phonetic>.from(json["phonetics"].map((x) => Phonetic.fromJson(x))),
        meanings: json["meanings"] == null ? null : List<Meaning>.from(json["meanings"].map((x) => Meaning.fromJson(x))),
        license: json["license"] == null ? null : License.fromJson(json["license"]),
        sourceUrls: json["sourceUrls"] == null ? null : List<String>.from(json["sourceUrls"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "word": IncomingWord == null ? null : IncomingWord,
        "phonetic": phonetic == null ? null : phonetic,
        "phonetics": phonetics == null ? null : List<dynamic>.from(phonetics!.map((x) => x.toJson())),
        "meanings": meanings == null ? null : List<dynamic>.from(meanings!.map((x) => x.toJson())),
        "license": license == null ? null : license!.toJson(),
        "sourceUrls": sourceUrls == null ? null : List<dynamic>.from(sourceUrls!.map((x) => x)),
    };
}

class License {
    License({
        this.name,
        this.url,
    });

    String? name;
    String ?url;

    factory License.fromJson(Map<String, dynamic> json) => License(
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "url": url == null ? null : url,
    };
}

class Meaning {
    Meaning({
        this.partOfSpeech,
        this.definitions,
    });

    String? partOfSpeech;
    List<Definition>? definitions;

    factory Meaning.fromJson(Map<String, dynamic> json) => Meaning(
        partOfSpeech: json["partOfSpeech"] == null ? null : json["partOfSpeech"],
        definitions: json["definitions"] == null ? null : List<Definition>.from(json["definitions"].map((x) => Definition.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "partOfSpeech": partOfSpeech == null ? null : partOfSpeech,
        "definitions": definitions == null ? null : List<dynamic>.from(definitions!.map((x) => x.toJson())),
    };
}

class Definition {
    Definition({
        this.definition,
        this.synonyms,
        this.antonyms,
        this.example,
    });

    String? definition;
    List<String>? synonyms;
    List<dynamic>? antonyms;
    String? example;

    factory Definition.fromJson(Map<String, dynamic> json) => Definition(
        definition: json["definition"] == null ? null : json["definition"],
        synonyms: json["synonyms"] == null ? null : List<String>.from(json["synonyms"].map((x) => x)),
        antonyms: json["antonyms"] == null ? null : List<dynamic>.from(json["antonyms"].map((x) => x)),
        example: json["example"] == null ? null : json["example"],
    );

    Map<String, dynamic> toJson() => {
        "definition": definition == null ? null : definition,
        "synonyms": synonyms == null ? null : List<dynamic>.from(synonyms!.map((x) => x)),
        "antonyms": antonyms == null ? null : List<dynamic>.from(antonyms!.map((x) => x)),
        "example": example == null ? null : example,
    };
}

class Phonetic {
    Phonetic({
        this.text,
        this.audio,
        this.sourceUrl,
        this.license,
    });

    String? text;
    String? audio;
    String? sourceUrl;
    License? license;

    factory Phonetic.fromJson(Map<String, dynamic> json) => Phonetic(
        text: json["text"] == null ? null : json["text"],
        audio: json["audio"] == null ? null : json["audio"],
        sourceUrl: json["sourceUrl"] == null ? null : json["sourceUrl"],
        license: json["license"] == null ? null : License.fromJson(json["license"]),
    );

    Map<String, dynamic> toJson() => {
        "text": text == null ? null : text,
        "audio": audio == null ? null : audio,
        "sourceUrl": sourceUrl == null ? null : sourceUrl,
        "license": license == null ? null : license!.toJson(),
    };
}
