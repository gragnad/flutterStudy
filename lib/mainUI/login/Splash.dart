import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: "Login Demo",
     theme: ThemeData(
       //brightness : Brightness.dark,
       primarySwatch: Colors.blueAccent,
       accentColor: Colors.orange,
       textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.orange),
       //fontFamily: 'SourceSansPro',
       textTheme: TextTheme(
         headline3: TextStyle(
           fontFamily: 'OpenSans',
           fontSize: 45.0,
           //fontWeight: Fontweight.w400,
           color: Colors.orange
         ),
         button: TextStyle(
           fontFamily: 'OpenSans'
         ),
         caption: TextStyle(
           fontFamily: 'NotoSans',
           fontSize: 12.0,
           fontWeight: FontWeight.normal,
           color: Colors.deepPurple[300],
         ),
         headline1: TextStyle(fontFamily: 'Quicksand'),

       ),
     ),
     // home: LoginScreen(),
   );
  }
}