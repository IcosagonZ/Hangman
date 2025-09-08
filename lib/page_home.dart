import 'package:flutter/material.dart';

import 'page_main.dart';

class Page_Home extends StatefulWidget
{
  const Page_Home({super.key});

  @override
  State<Page_Home> createState() => _Page_HomeState();
}

class _Page_HomeState extends State<Page_Home>
{
  // Dropdown for word lists
  final List<String> word_list_paths =
  [
    "assets/wordlist/clues_four.json",
    "assets/wordlist/clues_five.json",
    "assets/wordlist/clues_six.json",
  ];

  String? word_list_selected;

  @override
  Widget build(BuildContext context)
  {

    return Scaffold
    (
      /*
      appBar: AppBar
      (
        title: Text("Hangman"),
        actions:
        [
        ],
      ),
      */
      body: SizedBox.expand
      (
        child: Padding
        (
          padding: EdgeInsets.all(16),
          child: Column
          (
            children:
            [
              Expanded
              (
                child: Center(
                  child: Text
                (
                  "Hangman",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 32),
                )),
              ),
              Padding
              (
                padding: EdgeInsets.all(16),
                child: DropdownButton<String>
                (
                  hint: Text("Select wordlist"),
                  value: word_list_selected,
                  onChanged: (String? newValue)
                  {
                    setState(()
                    {
                      word_list_selected = newValue;
                    }
                    );
                  },
                  items: word_list_paths.map<DropdownMenuItem<String>>((String i)
                  {
                    return DropdownMenuItem<String>
                    (
                      value: i,
                    child: Text(i),
                    );
                  }
                  ).toList(),
                ),
              ),
              Row
              (
                children:
                [
                  Expanded
                  (
                    child: ElevatedButton
                    (
                      child: Text("Play game"),
                      onPressed: !(word_list_selected==null) ? ()
                      {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
                          {
                              return Page_Main(word_list_selected: word_list_selected ?? "none");
                          }
                        ));
                      } : null
                    ),
                  ),
                ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}
