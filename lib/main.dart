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

class _Page_MainState extends State<Page_Main> {

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text("Hangman"),
      ),
      body: Center
      (
        child: Column
        (
          children: <Widget>
          [
            Text("Hello"),
          ],
        ),
      ),
    );
  }
}
