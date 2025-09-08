import 'package:flutter/material.dart';

import 'game_data.dart';
import 'page_home.dart';
import 'page_main.dart';

class Page_Lost extends StatefulWidget
{
  const Page_Lost({super.key});

  @override
  State<Page_Lost> createState() => _Page_LostState();
}

class _Page_LostState extends State<Page_Lost>
{
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
                child: Center
                (
                  child: Text
                  (
                    "You lost",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 32),
                  )
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
                      child: Text("Next word"),
                      onPressed: ()
                      {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
                          {
                            return Page_Main(word_list_selected: wordlist_path);
                          }
                        ));
                      }
                    ),
                  ),
                  Expanded
                  (
                    child: ElevatedButton
                    (
                      child: Text("Go home"),
                      onPressed: ()
                      {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
                          {
                            return Page_Home();
                          }
                        ));
                      }
                    ),
                  ),
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}
