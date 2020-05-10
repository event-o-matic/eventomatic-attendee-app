import 'package:eventomaticattendeeapp/screens/startup_screen.dart';
import 'package:eventomaticattendeeapp/utils/theme_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:ThemeColors.primary,
        accentColor: ThemeColors.accent,
        fontFamily: "Gilroy",
      ),
      title: 'Eventomatic Attendee Application',
      home: StartupScreen(),
    );
  }
}