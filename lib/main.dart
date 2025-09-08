import 'package:flutter/material.dart';

import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';
import 'dart:math';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      title: "Hangman",
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Page_Main(),
    );
  }
}

class Page_Main extends StatefulWidget
{
  const Page_Main({super.key});

  @override
  State<Page_Main> createState() => _Page_MainState();
}

class _Page_MainState extends State<Page_Main>
{
  // Game variables
  var game_won = false;
  var game_lost = false;

  String game_word_display = "_____";
  String game_word = "hello";

  String game_letters_correct = ""; // Controls visibility of text on game word display
  String game_letters_used = ""; // Controls visibility of used letters

  var words;
  var words_keys_list;
  var words_total = 0;

  int game_tries_max = 7;
  int game_tries_incorrect = 0; // Controls visibility of man

  // Keyboard generation variables
  String row0  = "qwertyuiop";
  String row1 = "asdfghjkl";
  String row2 = "zxcvbnm";

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
    print(jsonData["description"]);

    words = jsonData["data"];
    words_keys_list = words.keys.toList();
    words_total = words.length;

    print(words_total);
  }

  // Word loader
  String word_retrive()
  {
    if(words_keys_list!=null)
    {
      var _game_word = words_keys_list[randomNumber(0, words_total)];
      print(_game_word);
      return _game_word;
    }
    else
    {
      return "none";
    }
  }

  void word_display_update()
  {
    game_word_display="";
    for(var letter in game_word.split(""))
    {
      if(game_letters_correct.contains(letter))
      {
        game_word_display+=letter;
      }
      else
      {
        game_word_display+="_";
      }
    }
  }

  void word_pressed(String letter)
  {
    if(game_word.contains(letter))
    {
      game_letters_used+=letter;
      game_letters_correct+=letter;
    }
    else
    {
      game_letters_used+=letter;
      game_tries_incorrect++;
      if(game_tries_incorrect>game_tries_max)
      {
        game_lost=true;
        print("GAME: Lost");
      }
    }
  }

  void word_check_win()
  {
    if(game_word==game_word_display)
    {
      game_won=true;
      print("GAME: Win");
    }
  }

  void ui_restart_clicked()
  {
    setState(()
    {
      game_word = word_retrive(); // Pick word randomly

      // Reset game variables
      game_won = false;
      game_lost = false;

      game_tries_incorrect = 0;

      game_letters_correct = "";
      game_letters_used = "";

      word_display_update();
    }
    );
  }

  void ui_keyboard_clicked(String letter)
  {
    setState(()
    {
      word_pressed(letter);
      word_display_update();
      word_check_win();
    }
    );
  }

  // Keyboard button generation variable
  List <Widget> keyboardGenerateButtons(String row)
  {
    return List<Widget>.generate(row.length, (index)
    {
      return Expanded
      (
        child: TextButton
        (
          onPressed: !game_letters_used.contains(row[index]) ? ()
          {
            ui_keyboard_clicked(row[index]);
            word_display_update();
          } : null,
          child: Text
          (
            row[index],
            style: TextStyle
            (
              fontSize: 20,
            )
          ),
          style: ElevatedButton.styleFrom
          (
            minimumSize: Size(double.infinity, double.infinity),
          ),
        )
      );
    });
  }

  @override
  void initState()
  {
    super.initState();
    jsonLoad();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text("Hangman"),
        actions:
        [
          ElevatedButton
          (
            child: Text("Refresh"),
            onPressed: ()
            {
              ui_restart_clicked();
            }
          )
        ]
      ),
      body: Padding
      (
        padding: EdgeInsets.all(16),
        child: Column
        (
          children: <Widget>
          [
            // Person image
            Expanded
            (
              flex: 4,
              child: Center
              (
                child:  Stack
                (
                  alignment: Alignment.center,
                  children: <Widget>
                  [
                    Image.asset("assets/person/person_0.png"),
                    Visibility
                    (
                      visible: game_tries_incorrect>=1,
                      child: Image.asset("assets/person/person_1.png"),
                    ),
                    Visibility
                    (
                      visible: game_tries_incorrect>=2,
                      child: Image.asset("assets/person/person_2.png"),
                    ),
                    Visibility
                    (
                      visible: game_tries_incorrect>=3,
                      child: Image.asset("assets/person/person_3.png"),
                    ),
                    Visibility
                    (
                      visible: game_tries_incorrect>=4,
                      child: Image.asset("assets/person/person_4.png"),
                    ),
                    Visibility
                    (
                      visible: game_tries_incorrect>=5,
                      child: Image.asset("assets/person/person_5.png"),
                    ),
                    Visibility
                    (
                      visible: game_tries_incorrect>=6,
                      child: Image.asset("assets/person/person_6.png"),
                    ),
                    Visibility
                    (
                      visible: game_tries_incorrect>=7,
                      child: Image.asset("assets/person/person_7.png"),
                    ),
                  ]
                )
              )
            ),
            // Text entry
            Text
            (
              game_word_display,
              style: TextStyle
              (
                fontFamily: "monofett",
                fontSize: 50,
              )
            ),
            // Keyboard
            Expanded
            (
              flex: 2,
              child: Column
              (
                children:
                [
                  Expanded
                  (
                    child: Row
                    (
                      children: keyboardGenerateButtons(row0),
                    ),
                  ),
                  Expanded
                  (
                    child: Row
                    (
                      children: keyboardGenerateButtons(row1),
                    ),
                  ),
                  Expanded
                  (
                    child: Row
                    (
                      children: keyboardGenerateButtons(row2),
                    ),
                  ),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
