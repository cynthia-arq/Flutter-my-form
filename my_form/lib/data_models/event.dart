//Data model for ""
import 'dart:core';

import 'package:my_form/data_models/custom_field.dart';
import 'package:my_form/data_models/external_link.dart';
import 'package:my_form/data_models/session.dart';

class Event extends Object {
  final String eventId;
  final String label;
  final String eventType;
  final String title;
  final String description;
  final String image;
  final List<String> images;
  final String cost;
  final String location;
  final String displayReserve;
  final bool displayImageTag;
  final String category;
  final List<CustomField> customFields;
  final List<ExternalLink> externalLinks;
  final List<Session> sessions;

  Event(this.eventId,
      this.label,
      this.eventType,
      this.title,
      this.description,
      this.image,
      this.images,
      this.cost,
      this.location,
      this.displayReserve,
      this.displayImageTag,
      this.category,
      this.customFields,
      this.externalLinks,
      this.sessions);


  Event.fromJSON(Map<String, dynamic> json)
      : eventId = json['eventid'],
        label = json['Label'],
        eventType = json['EventType'],
        title = json['title'],
        description = json['description'],
        image = json['image'],
        images = json["images"].cast<String>(),
        cost = json['cost'],
        location = json['location'],
        displayReserve = json['display_reserve'],
        displayImageTag = json['display_image_tag'],
        category = json['category'],
        customFields = (json["customfields"] as List<dynamic>)
            .map((item) => CustomField.fromJSON(item)).toList(),
        externalLinks = (json["external_links"] as List<dynamic>)
            .map((item) => ExternalLink.fromJSON(item)).toList(),
        sessions = (json["session"] as List<dynamic>)
            .map((item) => Session.fromJSON(item)).toList();

  @override
  bool operator==(dynamic other) => identical(this, other) || this.eventId == other.eventId;

  //@override
  //int get hashCode => eventId;
}