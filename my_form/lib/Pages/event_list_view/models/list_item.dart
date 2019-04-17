
// The base class for the different types of items the List can contain
import 'package:my_form/data_models/event.dart';

abstract class ListItem {}

// A ListItem that contains data to display a heading
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

// A ListItem that contains data to display a message
class EventCellItem implements ListItem {
  final String name;
  final String imageUrl;
  final String description;
  final Event eventData;

  EventCellItem(this.name, this.imageUrl, this.description, this.eventData);
}

// A ListItem that contains data to display a message
class SessionCellItem implements ListItem {
  final String time;
  final String duration;
  final String cost;
  final Event eventData;

  SessionCellItem(this.time, this.duration, this.cost, this.eventData);
}