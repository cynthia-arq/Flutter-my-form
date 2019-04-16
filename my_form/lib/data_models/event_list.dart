
import 'dart:core';

import 'package:my_form/data_models/event.dart';

class EventList {
  final List<Event> eventList;
  final UserDetail userDetail;

  EventList(this.eventList,
      this.userDetail);

  EventList.fromJSON(Map<String, dynamic> json)
      : eventList = (json["event_list"] as List<dynamic>)
        .map((item) => Event.fromJSON(item)).toList(),
        userDetail  = UserDetail.fromJSON(json["userdetails"]);
}

class UserDetail {
  final String name;
  final String email;
  final String mobile;
  final String company;

  UserDetail(this.name,
      this.email,
      this.mobile,
      this.company);

  UserDetail.fromJSON(Map<String, dynamic> json)
      : name = json["name"],
        email  = json["email"],
        mobile  = json["mobile"],
        company  = json["company"];

}