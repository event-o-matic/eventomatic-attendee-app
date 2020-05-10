import 'dart:convert';
import 'dart:io';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:eventomaticattendeeapp/data/demo_data.dart';
import 'package:eventomaticattendeeapp/models/user.dart';
import 'package:eventomaticattendeeapp/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

const API_URL = "https://eventomatic-api.herokuapp.com";

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String error;
  String text;
  Color textColor = Colors.black;

  Future _scanQR() async {
    setState(() {
      text = "Scanning...";
      textColor = Colors.black;
      error = null;
    });
    try {
      String qrResult = (await BarcodeScanner.scan()).rawContent;
      if(qrResult.isEmpty)
        throw FormatException("Invalid Inputs!");

      final result = await http.get(
        "$API_URL/attendees/$qrResult",
        headers: {"Content-type": "Application/json"},
      );
      if (result.statusCode != 200)
        throw FormatException("Invalid Inputs!");

      final decodedResult = jsonDecode(result.body);
      print(decodedResult);
      if(!(decodedResult is Map) || decodedResult["data"] == null || !(decodedResult["data"] is Map)){
        throw FormatException("Invalid Inputs!");
      }
      setState(() {
        demoData.loggedInUser = User.fromJson(decodedResult["data"]);
        text = "Success: ${demoData.loggedInUser.fullName}";
        textColor = Colors.green;
      });

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileScreen(user: demoData.loggedInUser,)));
    } on PlatformException catch (ex) {
      error = ex.code == BarcodeScanner.cameraAccessDenied
          ? "Camera permission was denied"
          : "Unknown Error $ex";
    } on HttpException catch (e) {
      error = e.message;
    } on FormatException catch (e) {
      print(e);
      if (e.message == "Invalid envelopmine")
        error = "You pressed the back button before scanning anything!";
      else
        error = e.message;
    } catch (ex) {
      error = "Unknown Error $ex";
    } finally {
      if (error != null) {
        setState(() {
          text = "Error: $error";
          textColor = Colors.red;
        });
      }
    }
  }

  @override
  void initState() {
    text = "Scan QR code to Login";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan QR code to Login"),
      ),
      body: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: new TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
        onPressed: _scanQR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}