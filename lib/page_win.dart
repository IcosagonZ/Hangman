import 'package:flutter/material.dart';

import 'game_data.dart';
import 'page_home.dart';
import 'page_main.dart';

class Page_Win extends StatefulWidget
{
  const Page_Win({super.key});

  @override
  State<Page_Win> createState() => _Page_WinState();
}

class _Page_WinState extends State<Page_Win>
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
                    "You won",
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
