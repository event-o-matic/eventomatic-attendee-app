  import 'package:eventomaticattendeeapp/data/demo_data.dart';
import 'package:eventomaticattendeeapp/models/event.dart';
import 'package:eventomaticattendeeapp/models/session.dart';
import 'package:eventomaticattendeeapp/screens/schedule_screen.dart';
  import 'package:flutter/material.dart';

  class EventDetailsScreen extends StatelessWidget {
    final Event event;

    const EventDetailsScreen({Key key, this.event}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.date_range),
          label: Text("See Schedule"),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ScheduleScreen(event: event),fullscreenDialog: true)),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
              appBar: AppBar(
                title: Text(event.title),
              ),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "વિગત: ",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    Text(event.description),
                    SizedBox(height: 50),
                    Text("ઉપસ્થિતો (${event.attendees.length}): ",  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: event.attendees
                            .map(
                              (u) => Card(
                                child: Container(
                                  width: 100,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(10),
                                  child: Text(u.fullName),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    SizedBox(height: 50),
                    Text("વક્તાઓ (${event.speakers.length}): ", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),

                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: event.speakers
                            .map(
                              (u) => Card(
                                child: Container(
                                  width: 100,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(10),
                                  child: Text(u.fullName),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),SizedBox(height: 50),
                    Text("સ્વયંસેવકો (${event.volunteers.length}): ", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),

                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: event.volunteers
                            .map(
                              (u) => Card(
                                child: Container(
                                  width: 100,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(10),
                                  child: Text(u.fullName),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),

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
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ],
      );
    }
  }
