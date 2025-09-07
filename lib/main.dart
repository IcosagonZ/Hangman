import 'package:flutter/material.dart';

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
  String game_word_display = "h e l l o";

  // Visibility variables
  int person_state = 7;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text("Hangman"),
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
                      visible: person_state>=1,
                      child: Image.asset("assets/person/person_1.png"),
                    ),
                    Visibility
                    (
                      visible: person_state>=2,
                      child: Image.asset("assets/person/person_2.png"),
                    ),
                    Visibility
                    (
                      visible: person_state>=3,
                      child: Image.asset("assets/person/person_3.png"),
                    ),
                    Visibility
                    (
                      visible: person_state>=4,
                      child: Image.asset("assets/person/person_4.png"),
                    ),
                    Visibility
                    (
                      visible: person_state>=5,
                      child: Image.asset("assets/person/person_5.png"),
                    ),
                    Visibility
                    (
                      visible: person_state>=6,
                      child: Image.asset("assets/person/person_6.png"),
                    ),
                    Visibility
                    (
                      visible: person_state>=7,
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
            Text("Hello"),
          ],
        ),
      ),
    );
  }
}
