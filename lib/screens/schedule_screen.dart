import 'package:collection/collection.dart';
import 'package:eventomaticattendeeapp/models/event.dart';
import 'package:eventomaticattendeeapp/models/session.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class ScheduleScreen extends StatelessWidget {
  final Event event;

  ScheduleScreen({Key key, this.event});

  @override
  Widget build(BuildContext context) {
    final groupedSchedule =
        groupBy(event.schedule, (Session session) => session.time);
    final List<DateTime> sortedKeys = groupedSchedule.keys.toList()..sort((a,b) => a.compareTo(b));
    return DefaultTabController(
      length: groupedSchedule.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(event.title),
          bottom: TabBar(
              tabs: sortedKeys
                  .map((key) => Text(intl.DateFormat('EEE\nMMM d').format(key), textAlign: TextAlign.center,))
                  .toList()),
        ),
        body: TabBarView(
          children: sortedKeys
              .map((k) => ListView(
                    children: groupedSchedule[k]
                        .map((s) => Card(
//                      color: s.isConsumable ? Colors.greenAccent: Colors.white,
                              child: ListTile(
                                title: Text(s.title),
                                subtitle: Text(s.description),
                                leading: CircleAvatar(child: Icon(s.isConsumable ? Icons.check : Icons.close),),
                              ),
                            ))
                        .toList(),
                  ))
              .toList(),
        ),
      ),
    );
  }

}
