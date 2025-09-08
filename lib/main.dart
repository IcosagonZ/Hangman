import 'package:flutter/material.dart';

import 'game_data.dart';
import 'page_win.dart';
import 'page_lost.dart';

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

  int game_tries_max = 7;
  int game_tries_incorrect = 0; // Controls visibility of man

  // Keyboard generation variables
  String row0  = "qwertyuiop";
  String row1 = "asdfghjkl";
  String row2 = "zxcvbnm";

  // Win page
  void page_open_win(BuildContext context)
  {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
    {
      return Page_Win();
    }
    ));
  }

  // Lost page
  void page_open_lost(BuildContext context)
  {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
    {
      return Page_Lost();
    }
    ));
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
    }
  }

  void word_check_win(BuildContext context)
  {
    if(game_word==game_word_display)
    {
      game_won=true;
      print("GAME: Win");
      page_open_win(context);
    }

    if(game_tries_incorrect>game_tries_max)
    {
      game_lost=true;
      print("GAME: Lost");
      page_open_lost(context);
    }
  }

  Future<void> ui_restart_clicked() async
  {
    game_word = await word_retrive(); // Pick word randomly

    setState(()
    {
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

  void ui_keyboard_clicked(BuildContext context, String letter)
  {
    setState(()
    {
      word_pressed(letter);
      word_display_update();
      word_check_win(context);
    }
    );
  }

  // Keyboard button generation variable
  List <Widget> keyboardGenerateButtons(BuildContext context, String row)
  {
    return List<Widget>.generate(row.length, (index)
    {
      return Expanded
      (
        child: TextButton
        (
          onPressed: !game_letters_used.contains(row[index]) ? ()
          {
            ui_keyboard_clicked(context, row[index]);
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
    ui_restart_clicked();
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
                      children: keyboardGenerateButtons(context, row0),
                    ),
                  ),
                  Expanded
                  (
                    child: Row
                    (
                      children: keyboardGenerateButtons(context, row1),
                    ),
                  ),
                  Expanded
                  (
                    child: Row
                    (
                      children: keyboardGenerateButtons(context, row2),
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
