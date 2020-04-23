import 'package:flutter/material.dart';
import 'package:get_profit/screens/login_screen.dart';
import 'package:get_profit/screens/service/service_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';



Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var login = prefs.getString("login");
  print(login);
  runApp(MaterialApp(
    home: login == null ? LoginScreen() : ServiceList(),
    theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        hintColor: Colors.white,
        primaryColor: Colors.white
    ),
    debugShowCheckedModeBanner: false,
  ));

}
