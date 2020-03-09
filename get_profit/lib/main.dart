import 'package:flutter/material.dart';
import 'package:get_profit/screens/home_screen.dart';
import 'package:get_profit/screens/login_screen.dart';
import 'package:get_profit/screens/product_screen.dart';
import 'package:get_profit/screens/provider_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scoped_model/scoped_model.dart';


void main() async{
  runApp(MaterialApp(
    home: ProviderScreen(),
    theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        hintColor: Colors.white,
        primaryColor: Colors.white
    ),
    debugShowCheckedModeBanner: false,
  ));
}
