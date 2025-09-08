import 'package:flutter/material.dart';

import 'main.dart';

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
      appBar: AppBar
      (
        title: Text("Hangman"),
        actions:
        [
        ],
      ),
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
                child: Text("You won"),
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
                            return Page_Main();
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
