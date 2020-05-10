import 'package:eventomaticattendeeapp/data/demo_data.dart';
import 'package:eventomaticattendeeapp/screens/home_screen.dart';
import 'package:eventomaticattendeeapp/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class StartupScreen extends StatefulWidget {
  @override
  _StartupScreenState createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: demoData.loggedInUser != null ? ProfileScreen() : HomeScreen(),
    );
  }
}
