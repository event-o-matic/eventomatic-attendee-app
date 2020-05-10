import 'package:eventomaticattendeeapp/data/constraints.dart';
import 'package:eventomaticattendeeapp/data/demo_data.dart';
import 'package:eventomaticattendeeapp/models/user.dart';
import 'package:eventomaticattendeeapp/screens/event_details_screen.dart';
import 'package:flutter/material.dart';



class ProfileScreen extends StatelessWidget {
  final User user;

  const ProfileScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.event),
        label: Text("Event Details"),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetailsScreen(event: demoData.currentEvent,))),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text(user.fullName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Table(
              columnWidths: {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
              children: [
                _row("Name: ", user.fullName),
                _row("Email: ", user.email),
                _row("role: ", user.role),
              ],
            ),
            SizedBox(height: 50),
            ...Constraints.utilities
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
