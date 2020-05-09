import 'package:eventomaticattendeeapp/models/attendee.dart';
import 'package:flutter/material.dart';

const allowedUtils = [
  "checkin",
  "regkit",
  "breakfast",
  "lunch",
  "dinner",
  "prize",
  "certificate",
];

class ProfileScreen extends StatelessWidget {
  final User user;

  const ProfileScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.fullname),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Table(
              columnWidths: {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
              children: [
                _row("Name: ", user.fullname),
                _row("Email: ", user.email),
                _row("role: ", user.category),
              ],
            ),
            SizedBox(height: 50),
            ...allowedUtils
                .map((u) => Card(
                      color: user.utils.contains(u)
                          ? Colors.lightGreen
                          : Colors.deepOrangeAccent,
                      child: ListTile(
                        title: Text(u),
                      ),
                    ))
                .toList()
          ],
        ),
      ),
    );
  }

  TableRow _row(String key, String value) {
    return TableRow(
      children: [
        Text(
          key,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
        ),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ],
    );
  }
}
