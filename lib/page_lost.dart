import 'package:flutter/material.dart';

import 'main.dart';

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
                child: Text("You lost"),
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
