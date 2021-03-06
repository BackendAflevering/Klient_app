import 'package:flutter/material.dart';
//other imports
import 'package:backendappklient/pages/MainTabs.dart';
import 'package:backendappklient/pages/loginpage.dart';
// This main.dart contains the login page.
// master
void main()=> runApp(new MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
        home: new LoginPage(), // This will be the loginpage, calling the login class below
        theme : new ThemeData(
            primarySwatch: Colors.blue
        ),
      initialRoute: 'home',
      routes: {
        'home': (context) => LoginPage(),
        '/Profile Page': (context) => TabLayout(),

      },
    );
  }
}