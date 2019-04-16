
// The base class for the different types of items the List can contain
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

  EventCellItem(this.name, this.imageUrl, this.description);
}