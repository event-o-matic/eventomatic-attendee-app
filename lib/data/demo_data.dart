import 'dart:convert';
import 'dart:math';

import 'package:eventomaticattendeeapp/data/constraints.dart';
import 'package:eventomaticattendeeapp/models/event.dart';
import 'package:eventomaticattendeeapp/models/session.dart';
import 'package:eventomaticattendeeapp/models/user.dart';
import 'package:http/http.dart' as http;

const API_URL = "https://eventomatic-api.herokuapp.com";

class DemoData {
  User loggedInUser;

  List<User> allUsers = [];

  DemoData() {
    getAllUsers();
  }

  Random r = Random();

  Event get currentEvent => allUsers.isEmpty ? null:Event(
        id: "fbdijbvdfoivbjdiofnbjofdnb",
        title: "ICRED, Navrachna university",
        description: "Amazing description fro event.",
        attendees: allUsers.where((u) => u.role == Constraints.userRoles[4]).toList(),
        volunteers: allUsers.where((u) => u.role == Constraints.userRoles[2]).toList(),
        speakers: allUsers.where((u) => u.role == Constraints.userRoles[3]).toList(),
        thumbnailImage:
            "https://images.unsplash.com/photo-1540575467063-178a50c2df87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80",
        schedule: List.generate(
          25,
          (index) => Session(
              title: "The $index th session",
              description: "amazing session description",
              isConsumable: index.isEven,
              time: DateTime(2020, 1, (index+1) % 5),
              venue: "HERE"),
        ),
      );

  Future getAllUsers() async {
    try {
      final result = await http.get("$API_URL/attendees",
          headers: {"Content-type": "Application/json"});
      final Map<String, dynamic> decodedResult = json.decode(result.body);
      if (decodedResult["data"] == null || !(decodedResult["data"] is List))
        throw Exception("Correct data format is not recieved!");

      allUsers = decodedResult["data"].map<User>((u) => User.fromJson(u)).toList();
    } catch (e) {
      print("ERROR from DemoData -> getAllUser() : $e");
    }
  }
}

final DemoData demoData = DemoData();
