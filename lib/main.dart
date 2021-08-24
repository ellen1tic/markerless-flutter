import 'package:app2/constants/constants.dart';
import 'package:app2/pages/OnBoarding.dart';
import 'package:flutter/material.dart';
import 'package:app2/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int isViewed;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt("onBoard");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: "Poppins",
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kBackgroundColor),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
