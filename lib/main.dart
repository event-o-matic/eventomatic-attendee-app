import 'package:eventomaticattendeeapp/screens/scanning_screen.dart';
import 'package:eventomaticattendeeapp/screens/startup_screen.dart';
import 'package:eventomaticattendeeapp/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp]);
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
      home: ScanningScreen(),
    );
  }
}