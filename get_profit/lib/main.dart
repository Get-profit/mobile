import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:get_profit/screens/login_screen.dart';


void main() async{
  runApp(MaterialApp(
    home: LoginScreen(),
    theme: ThemeData(
        hintColor: Colors.white,
        primaryColor: Colors.white
    ),
    debugShowCheckedModeBanner: false,
  ));
}
