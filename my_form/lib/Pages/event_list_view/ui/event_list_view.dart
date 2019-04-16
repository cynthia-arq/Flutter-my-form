
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_form/Pages/event_list_view/models/list_item.dart';

class EventListView extends StatelessWidget {
  const EventListView({
    Key key,
    @required this.items,
  }) : super(key: key);

  final List<ListItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          if (item is HeadingItem) {
            return ListTile(
              title: Text(
                item.heading,
                style: Theme.of(context).textTheme.headline,
              ),
            );
          } else if (item is EventCellItem) {
            return ListTile(
              title: Text(item.name),
              subtitle: Text(item.description),
            );
          }
        });
  }
}