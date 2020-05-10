
import 'package:eventomaticattendeeapp/models/session.dart';
import 'package:eventomaticattendeeapp/models/user.dart';

class Event{
  String id;
  String title;
  String description;
  String thumbnailImage;
  List<Session> schedule;
  List<User> volunteers;
  List<User> attendees;
  List<User> speakers;

  Event({this.id, this.title, this.description, this.thumbnailImage,
      this.schedule, this.volunteers, this.attendees, this.speakers});
}