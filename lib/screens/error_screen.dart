import 'package:eventomaticattendeeapp/utils/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatefulWidget {
  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  TextStyle headTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  TextStyle bodyTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            "assets/images/bgimage.jpeg",
            fit: BoxFit.fill,
            width: 250,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: ThemeColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Scan QR code to login",
                    style: headTextStyle,
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Place QR code inside the frame to scan. Please avoid shake to get result quickly.",
                      style: bodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(70, 70, 70, 50),
                    child: Image.asset("assets/images/QR.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Something went wrong, please try again",
                      style: TextStyle(
                        color: ThemeColors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    width: 170,
                    height: 50,
                    child: RaisedButton(
                      onPressed: () {},
                      color: ThemeColors.red,
                      textColor: Colors.white,
                      child: Text(
                        "Error !",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),

            ),
          ),
        ],
      ),

    );
  }
}
