import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled12/login_screen.dart';
import 'package:untitled12/table_screen.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.brown.shade200,
            statusBarIconBrightness:Brightness.dark,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: login_screen(),
    );
  }
}