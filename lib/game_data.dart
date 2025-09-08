// Wordlist loader
import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';
import 'dart:math';

var wordlist_loaded = false;

var words;
var words_keys_list;
var words_total = 0;

// Random number finder
int randomNumber(int min, int max)
{
  final random = Random();
  return min + random.nextInt(max - min + 1);
}

// JSON loader
Future<void> jsonLoad() async
{
  String jsonString = await rootBundle.loadString("assets/wordlist/clues_four.json");

  var jsonData = jsonDecode(jsonString);
  //print(jsonData["description"]);

  words = jsonData["data"];
  words_keys_list = words.keys.toList();
  words_total = words.length;

  //print(words_total);
  wordlist_loaded = true;

  print("GAME: Loaded wordlist");
}

// Word loader
Future<String> word_retrive() async
{
  if(!wordlist_loaded)
  {
    await jsonLoad();
  }

  if(wordlist_loaded)
  {
    if(words_keys_list!=null)
    {
      var _game_word = words_keys_list[randomNumber(0, words_total)];
      print(_game_word);
      return _game_word;
    }
  }

  return "none";
}
