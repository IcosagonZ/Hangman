import 'package:flutter/material.dart';

import 'page_home.dart';

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
      theme: ThemeData.dark().copyWith
      (
        snackBarTheme: SnackBarThemeData
        (
          backgroundColor: Color.fromRGBO(18,11,33,1),
          contentTextStyle: TextStyle
          (
            color: Color.fromRGBO(255,255,255,1),
          ),
        )
      ),
      debugShowCheckedModeBanner: false,
      home: Page_Home(),
    );
  }
}


